(function () {

    // 차단할 메뉴
    const BLOCK_MENU = [
        "의료급여",
        "요양급여"
    ];

    function blockMenu() {

        document.querySelectorAll("a").forEach(function (a) {

            const text = a.innerText.trim();

            if (!BLOCK_MENU.includes(text))
                return;

            if (a.dataset.blocked)
                return;

            a.dataset.blocked = "1";

            a.style.cursor = "not-allowed";
            a.style.opacity = "0.5";

            a.addEventListener("click", function (e) {

                e.preventDefault();
                e.stopPropagation();
                e.stopImmediatePropagation();

                alert("관리자에 의해 사용할 수 없는 메뉴입니다.");

                return false;

            }, true);

        });

    }

    blockMenu();

    const observer = new MutationObserver(() => {
        blockMenu();
    });

    observer.observe(document.body, {
        childList: true,
        subtree: true
    });

})();