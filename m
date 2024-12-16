Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C41C09F2E7D
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Dec 2024 11:48:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67F9DC71292;
	Mon, 16 Dec 2024 10:48:54 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6EE77C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Dec 2024 10:48:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3CD2210485583; Mon, 16 Dec 2024 11:48:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1734346125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Za1qix9JUC09ToDEoUUTr8e+BFUBM5V10zVNxMXFSIA=;
 b=O+pY6u1Q+ijtVw3tzhJCjRyROFg7PkpQszT0yM/rcH+hd4qsAIVLdq+xpC9RQgSTZS6gAr
 SVNkk8yHprfW4Urq+IO5xEZxdCAfB/jFanMP/D6vaDR0hJLEcIb6NXblxrsR81af8V+z2y
 FKT1+GPJCUoEotD+Ep5woz1b4FtL2KpFY9pEASkpc4ADmeLWxIvxQSORe6Dk/Bn4aumKx2
 eQxOy0DpTxjs7vv0OZYfODR1r+KwUkKO69l/1IL9lTOEw0zh7zG6akB+VMKIqP7sJ+lrAA
 An1CA7zDts5vP1rlGug1RJv0b27WsvRL5t2fpeJJJthTy0s1AVrcqXIrthgXPw==
From: Marek Vasut <marex@denx.de>
To: linux-leds@vger.kernel.org
Date: Mon, 16 Dec 2024 11:48:22 +0100
Message-ID: <20241216104826.6946-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: Marek Vasut <marex@denx.de>, Andrew Lunn <andrew@lunn.ch>,
 netdev@vger.kernel.org, Lee Jones <lee@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Daniel Golle <daniel@makrotopia.org>,
 kernel@dh-electronics.com, Pavel Machek <pavel@ucw.cz>,
 Lukasz Majewski <lukma@denx.de>, Heiner Kallweit <hkallweit1@gmail.com>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: [Linux-stm32] [PATCH v2] leds: trigger: netdev: Check offload
	ability on interface up
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

The trigger_data->hw_control indicates whether the LED is controlled by HW
offload, i.e. the PHY. The trigger_data->hw_control = can_hw_control() is
currently called only from netdev_led_attr_store(), i.e. when writing any
sysfs attribute of the netdev trigger instance associated with a PHY LED.

The can_hw_control() calls validate_net_dev() which internally calls
led_cdev->hw_control_get_device(), which is phy_led_hw_control_get_device()
for PHY LEDs. The phy_led_hw_control_get_device() returns NULL if the PHY
is not attached.

At least in case of DWMAC (STM32MP, iMX8M, ...), the PHY device is attached
only when the interface is brought up and is detached again when the
interface is brought down. In case e.g. udev rules configure the netdev
LED trigger sysfs attributes before the interface is brought up, then when
the interface is brought up, the LEDs are not blinking.

This is because trigger_data->hw_control = can_hw_control() was called
when udev wrote the sysfs attribute files, before the interface was up,
so can_hw_control() resp. validate_net_dev() returned false, and the
trigger_data->hw_control = can_hw_control() was never called again to
update the trigger_data->hw_control content and let the offload take
over the LED blinking.

Call data->hw_control = can_hw_control() from netdev_trig_notify() to
update the offload capability of the LED when the UP notification arrives.
This makes the LEDs blink after the interface is brought up.

On STM32MP13xx with RTL8211F, it is enough to have the following udev rule
in place, boot the machine with cable plugged in, and the LEDs won't work
without this patch once the interface is brought up, even if they should:
"
ACTION=="add", SUBSYSTEM=="leds", KERNEL=="stmmac-0:01:green:wan", ATTR{trigger}="netdev", ATTR{link_10}="1", ATTR{link_100}="1", ATTR{link_1000}="1", ATTR{device_name}="end0"
ACTION=="add", SUBSYSTEM=="leds", KERNEL=="stmmac-0:01:yellow:wan", ATTR{trigger}="netdev", ATTR{rx}="1", ATTR{tx}="1", ATTR{device_name}="end0"
"

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Christian Marangi <ansuelsmth@gmail.com>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>
Cc: Daniel Golle <daniel@makrotopia.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Lee Jones <lee@kernel.org>
Cc: Lukasz Majewski <lukma@denx.de>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: kernel@dh-electronics.com
Cc: linux-leds@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: netdev@vger.kernel.org
---
V2: Add RB from Andrew
---
 drivers/leds/trigger/ledtrig-netdev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index 4b0863db901a9..c15efe3e50780 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -605,6 +605,8 @@ static int netdev_trig_notify(struct notifier_block *nb,
 		trigger_data->net_dev = NULL;
 		break;
 	case NETDEV_UP:
+		trigger_data->hw_control = can_hw_control(trigger_data);
+		fallthrough;
 	case NETDEV_CHANGE:
 		get_device_state(trigger_data);
 		/* Refresh link_speed visibility */
-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
