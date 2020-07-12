document.addEventListener("DOMContentLoaded", () => {
  (document.querySelectorAll(".message-body .delete") || []).forEach(
    ($delete) => {
      $notification = $delete.parentNode;

      $delete.addEventListener("click", () => {
        $notification.parentNode.removeChild($notification);
      });
    }
  );
});
