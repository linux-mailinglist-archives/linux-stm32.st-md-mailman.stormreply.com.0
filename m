Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIXVDH6T+GmwwgIAu9opvQ:T3
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 14:39:27 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B71A4BD034
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 14:39:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34BF9C60467;
	Mon,  4 May 2026 12:39:27 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7A6CC8F273
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 May 2026 15:54:58 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-8b1f2b7f1bcso28194056d6.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 May 2026 08:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777650898; x=1778255698;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wC9LgXYHX18qXHOQH91JWhKa/OCKeKNcth3XKvgxSns=;
 b=oWVptr3M3/zZFRkXl/mhkdoYCclon9hWFuOkQbXmq8I0rkKjEd1yyRFUcA119vIF1i
 aLbnl6uasVVOXVF0gTLKon1q/TVDe0X7ka+MvV3cajbETNvoX1b/XGWdr2KiFXGwPGpX
 akpLxyd0ijCd6luUPitkXI/GrE0nf5P+aXwrqBdq4rUy5m2t6ltCzD1cjr/jAMbrDHfc
 VFZUm5Mvg6ABRk2Pqpq8tRsfriRMY+CdwOlLrcooYwEV+ef00391Rg0/bYhraeqEDQQp
 Ms0hIcqvh9D2XQcFixClorT/g72wHVQfYb3yfPpSSFW+47mF+Q581CI2lmd8hUO+EIuR
 J5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777650898; x=1778255698;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wC9LgXYHX18qXHOQH91JWhKa/OCKeKNcth3XKvgxSns=;
 b=OqYeMT+hc8YVIJyc5Aih/Tc9S/jefG3IY56WGd6J3wjn4ZOrHO0IFpgfWHdAzSJYMm
 ErMJjzlMILyueEOYGuCFBhq691VDfOyzfyqlppIB4PPzOBYEa7+fVBabgQ4MPrW0rcvz
 zWm7wq5IG6PUyERNNG3tu+HfiHimnr8mWicS1SWO7QFvpwTY3rHBwLwyKWL7TvAf6zQ2
 NBVn441MaTSl3bn6Gl/9zLhPsiOhyuQru2KOAFfENVpTEWQvmUejN6S2H2wrn3BQoJyV
 rgCyR5qfaM6a7nsdW5yzgRkuPerHUu03omHh/xx9ROtSM6lks25718eSO+kBLBNxMKi+
 f/BQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ82MpUVdg2CIgt38KLoU91rg0JqByEm26ieIGJHZE3sUH/Pj4xjOkfh2jelj7B32wgZSckPlXSo98r1iA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwCfeORu97YFNAiAAOvKYy9OwiGfWV44ul3EFD52fpCmDKNsTHR
 9tN0BtL0zd60l5PW869cjDLrd3YGXOJSvQYNQWjfBqoQa757Q92kEzqRZWY+rKTTeLg=
X-Gm-Gg: AeBDievnG6kKneOnZVymykIbd8WfLA10CTFBc011Y0iVZJwbyKt2wcGybzIUMsfXr9U
 3NbU1A/Tf5KKUY2o/jgclKGxGUACWOH/Nuny6UUUP2gvDr0ljoysvzIT5woWzJVxpi7UFrxiN5H
 ANIbgvj1tHU5u8lT2ohe7qA1238vz6cRTFIT5Jvw2CnMw961t09FC7jipoWtBWuwkT7GkVK7Vtn
 pmXbgCACsmOsvVg9RhW3loEu2oSrzg7ERGc4kVCnuphcQGQxsFFvijkBkA4nJ8sxLM4b7qWiYdD
 HmTDKMY8jNjrzROrp+kXppn5t7VJEAQP5dRdc4+2iNZMnbJ9QjdNsMIO9pT72HQ0k2Vlb8O0BJY
 1AU147RvV/iF3VuKgKYlvBE7dT0sTYEhov92zVFlQUUIcVLRZYpKAutDV51pkViG8eJ1uKk7gWl
 e9tLRfH7wGjLhODaHeU7oqoTR13S7ChbWUk8xfVBqFui+lym8RX82FI1uKsKmZmwBAQmk+4gkK7
 11HIQ==
X-Received: by 2002:ad4:5ba5:0:b0:8ac:adca:2325 with SMTP id
 6a1803df08f44-8b40001d5b5mr105107896d6.15.1777650897594; 
 Fri, 01 May 2026 08:54:57 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net.
 [75.72.117.212]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8b539aa7293sm26615406d6.22.2026.05.01.08.54.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2026 08:54:57 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linusw@kernel.org, brgl@kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org
Date: Fri,  1 May 2026 10:54:17 -0500
Message-ID: <20260501155421.3329862-10-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260501155421.3329862-1-elder@riscstar.com>
References: <20260501155421.3329862-1-elder@riscstar.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 04 May 2026 12:39:23 +0000
Cc: me@ziyao.cc, linux-kernel@vger.kernel.org, daniel@riscstar.com,
 chenchuangyu@xiaomi.com, linux-stm32@st-md-mailman.stormreply.com,
 mohd.anwar@oss.qualcomm.com, weishangjuan@eswincomputing.com,
 daniel@iogearbox.net, chenhuacai@kernel.org, john.fastabend@gmail.com,
 siyanteng@cqsoftware.com.cn, sdf@fomichev.me, devicetree@vger.kernel.org,
 hawk@kernel.org, elder@riscstar.com, linux-arm-msm@vger.kernel.org,
 richardcochran@gmail.com, rohan.g.thomas@altera.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, livelycarpet87@gmail.com,
 ast@kernel.org, linux-gpio@vger.kernel.org, wens@kernel.org,
 linux-arm-kernel@lists.infradead.org, inochiama@gmail.com,
 a0987203069@gmail.com, boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, bpf@vger.kernel.org, julianbraha@gmail.com,
 matthew.gerlach@altera.com, hkallweit1@gmail.com
Subject: [Linux-stm32] [PATCH net-next 09/12] gpio: tc956x: add
	TC956x/QPS615 support
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
X-Rspamd-Queue-Id: 7B71A4BD034
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	DATE_IN_PAST(1.00)[68];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:maxime.chevallier@bootlin.com,m:rmk+kernel@armlinux.org.uk,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:me@ziyao.cc,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:linux-stm32@st-md-mailman.stormreply.com,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:devicetree@vger.kernel.org,m:hawk@kernel.org,m:elder@riscstar.com,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:ast@kernel.org,m:linux-gpio@vger.kernel.org,m:wens@kernel.org,m:li
 nux-arm-kernel@lists.infradead.org,m:inochiama@gmail.com,m:a0987203069@gmail.com,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:bpf@vger.kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:hkallweit1@gmail.com,m:andrew@lunn.ch,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:conor@kernel.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_CC(0.00)[ziyao.cc,vger.kernel.org,riscstar.com,xiaomi.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,iogearbox.net,kernel.org,gmail.com,cqsoftware.com.cn,fomichev.me,altera.com,bp.renesas.com,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:-];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.661];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]

Toshiba TC956x is an Ethernet-AVB/TSN bridge and is essentially
a small and highly-specialized SoC.  TC956x includes a GPIO block that
can be accessed, alongside several other peripherals, via two PCIe
endpoint functions.  The PCIe function driver creates an auxiliary
device for the GPIO block, and that device gets bound to this auxiliary
device driver.

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/gpio/Kconfig       |  11 ++
 drivers/gpio/Makefile      |   1 +
 drivers/gpio/gpio-tc956x.c | 209 +++++++++++++++++++++++++++++++++++++
 3 files changed, 221 insertions(+)
 create mode 100644 drivers/gpio/gpio-tc956x.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 020e51e30317a..746cedea7e91d 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1646,6 +1646,17 @@ config GPIO_TC3589X
 	  This enables support for the GPIOs found on the TC3589X
 	  I/O Expander.
 
+config GPIO_TC956X
+	tristate "Toshiba TC956X GPIO support"
+	depends on TOSHIBA_TC956X_PCI
+	default m if TOSHIBA_TC956X_PCI
+	help
+	  This enables support for the GPIO controller embedded in the Toshiba
+	  TC956X (and Qualcomm QPS615).  This device connects to the host
+	  via PCIe port, which is the upstream port on an internal PCIe
+	  switch.  On some platforms, a few of the GPIO lines are used to
+	  manage external resets.
+
 config GPIO_TIMBERDALE
 	bool "Support for timberdale GPIO IP"
 	depends on MFD_TIMBERDALE
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index b267598b517de..c3584e7cba9b4 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -178,6 +178,7 @@ obj-$(CONFIG_GPIO_SYSCON)		+= gpio-syscon.o
 obj-$(CONFIG_GPIO_TANGIER)		+= gpio-tangier.o
 obj-$(CONFIG_GPIO_TB10X)		+= gpio-tb10x.o
 obj-$(CONFIG_GPIO_TC3589X)		+= gpio-tc3589x.o
+obj-$(CONFIG_GPIO_TC956X)		+= gpio-tc956x.o
 obj-$(CONFIG_GPIO_TEGRA186)		+= gpio-tegra186.o
 obj-$(CONFIG_GPIO_TEGRA)		+= gpio-tegra.o
 obj-$(CONFIG_GPIO_THUNDERX)		+= gpio-thunderx.o
diff --git a/drivers/gpio/gpio-tc956x.c b/drivers/gpio/gpio-tc956x.c
new file mode 100644
index 0000000000000..12221d8f812d9
--- /dev/null
+++ b/drivers/gpio/gpio-tc956x.c
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
+ */
+
+/*
+ * The Toshiba TC956X implements a PCIe Gen 3 switch that connects an
+ * upstream x4 port to two downstream PCIe x2 ports.  It incorporates
+ * an internal endpoint on a internal PCIe port that implements two
+ * Synopsys XGMAC Ethernet interfaces.
+ *
+ * 35 GPIOs are also implemented by an embedded GPIO controller.  Three
+ * registers control the first 32 GPIOs (other than 20 and 21, which are
+ * reserved).  Three other registers control GPIOs 32 through 36. GPIOs
+ * 22-24, 27-28, 31, and 34 are treated as "input only".
+ *
+ * There is a TC956X PCI power controller driver that accesses the
+ * direction and output value registers for GPIOs 2 and 3.  These
+ * GPIOs control the reset signal for the two downstream PCIe ports.
+ * Their values will never change during operation of this driver, and
+ * this driver reserves these two GPIOS.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/dev_printk.h>
+#include <linux/gpio/driver.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define DRIVER_NAME		"tc956x-gpio"
+
+#define TC956X_GPIO_COUNT	37	/* Number of GPIOs (20-21 reserved) */
+
+/* The GPIO offsets are relative to 0x1200 in TC956X SFR space */
+#define GPIO_IN0_OFFSET		0x00		/* Input value (0-31) */
+#define GPIO_EN0_OFFSET		0x08		/* 0: out; 1: in (0-31) */
+#define GPIO_OUT0_OFFSET	0x10		/* Output value (0-31) */
+
+#define GPIO_IN1_OFFSET		0x04		/* Input value (32-36) */
+#define GPIO_EN1_OFFSET		0x0c		/* 0: out; 1: in (32-36) */
+#define GPIO_OUT1_OFFSET	0x14		/* Output value (32-36) */
+
+/*
+ * struct tc956x_gpio - Information related to the embedded GPIO controller
+ * @chip:		GPIO chip structure
+ * @regmap:		MMIO register map for SFR GPIO region access
+ * @input_only:		Bitmap indicating which GPIOs are input-only
+ */
+struct tc956x_gpio {
+	struct gpio_chip chip;
+	struct regmap *regmap;
+	DECLARE_BITMAP(input_only, TC956X_GPIO_COUNT);
+};
+
+static int tc956x_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct tc956x_gpio *gpio = gpiochip_get_data(gc);
+	u32 reg;
+	u32 val;
+
+	if (test_bit(offset, gpio->input_only))
+		return GPIO_LINE_DIRECTION_IN;
+
+	reg = offset < 32 ? GPIO_EN0_OFFSET : GPIO_EN1_OFFSET;
+
+	regmap_read(gpio->regmap, reg, &val);
+	if (val & BIT(offset % 32))
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
+}
+
+static int tc956x_gpio_direction_input(struct gpio_chip *gc,
+				       unsigned int offset)
+{
+	u32 reg = offset < 32 ? GPIO_EN0_OFFSET : GPIO_EN1_OFFSET;
+	struct tc956x_gpio *gpio = gpiochip_get_data(gc);
+	u32 mask = BIT(offset % 32);
+
+	return regmap_update_bits(gpio->regmap, reg, mask, mask);
+}
+
+static int tc956x_gpio_direction_output(struct gpio_chip *gc,
+					unsigned int offset, int value)
+{
+	struct tc956x_gpio *gpio = gpiochip_get_data(gc);
+	u32 vreg;
+	u32 dreg;
+	u32 mask;
+
+	if (test_bit(offset, gpio->input_only))
+		return -EINVAL;
+
+	if (offset < 32) {
+		vreg = GPIO_OUT0_OFFSET;
+		dreg = GPIO_EN0_OFFSET;
+	} else {
+		vreg = GPIO_OUT1_OFFSET;
+		dreg = GPIO_EN1_OFFSET;
+	}
+	mask = BIT(offset % 32);
+
+	/* Set output value first, then direction */
+	regmap_update_bits(gpio->regmap, vreg, mask, value ? mask : 0);
+
+	return regmap_update_bits(gpio->regmap, dreg, mask, 0);
+}
+
+static int tc956x_gpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	u32 reg = offset < 32 ? GPIO_IN0_OFFSET : GPIO_IN1_OFFSET;
+	struct tc956x_gpio *gpio = gpiochip_get_data(gc);
+	u32 val;
+
+	regmap_read(gpio->regmap, reg, &val);
+
+	return val & BIT(offset % 32) ? 1 : 0;
+}
+
+static int tc956x_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	u32 reg = offset < 32 ? GPIO_OUT0_OFFSET : GPIO_OUT1_OFFSET;
+	struct tc956x_gpio *gpio = gpiochip_get_data(gc);
+	u32 mask = BIT(offset % 32);
+
+	return regmap_update_bits(gpio->regmap, reg, mask, value ? mask : 0);
+}
+
+static int tc956x_gpio_init_valid_mask(struct gpio_chip *gc,
+				       unsigned long *valid_mask,
+				       unsigned int ngpios)
+{
+	/*
+	 * GPIOs 2 and 3 are used by the PCI power control driver, and
+	 * we don't allow them to be used.  GPIOs 20 and 21 are reserved
+	 * (and not usable).
+	 */
+	bitmap_fill(valid_mask, ngpios);
+	bitmap_clear(valid_mask, 2, 2);
+	bitmap_clear(valid_mask, 20, 2);
+
+	return 0;
+}
+
+static int tc956x_gpio_probe(struct auxiliary_device *adev,
+			     const struct auxiliary_device_id *id)
+{
+	struct device *dev = &adev->dev;
+	struct tc956x_gpio *gpio;
+	struct gpio_chip *gc;
+
+	if (!dev->platform_data)
+		return -EINVAL;
+
+	gpio = devm_kzalloc(dev, sizeof(*gpio), GFP_KERNEL);
+	if (!gpio)
+		return -ENOMEM;
+	gpio->regmap = dev->platform_data;
+
+	/* Mark GPIOs 22, 23, 24, 27, 28, 31, and 34 as input only */
+	bitmap_set(gpio->input_only, 22, 3);
+	bitmap_set(gpio->input_only, 27, 2);
+	set_bit(31, gpio->input_only);
+	set_bit(34, gpio->input_only);
+
+	gc = &gpio->chip;
+
+	gc->label = DRIVER_NAME;
+	gc->parent = dev->parent;
+
+	gc->get_direction = tc956x_gpio_get_direction;
+	gc->direction_input = tc956x_gpio_direction_input;
+	gc->direction_output = tc956x_gpio_direction_output;
+	gc->get = tc956x_gpio_get;
+	gc->set = tc956x_gpio_set;
+	gc->init_valid_mask = tc956x_gpio_init_valid_mask;
+
+	gc->base = -1;
+	gc->ngpio = TC956X_GPIO_COUNT;
+	gc->can_sleep = false;
+
+	dev_set_drvdata(dev, gpio);
+
+	return devm_gpiochip_add_data(dev, gc, gpio);
+}
+
+static const struct auxiliary_device_id tc956x_gpio_ids[] = {
+	{ .name = "tc956x_pci.tc9564-gpio", },
+	{ }
+};
+MODULE_DEVICE_TABLE(auxiliary, tc956x_gpio_ids);
+
+static struct auxiliary_driver tc956x_gpio_driver = {
+	.name		= DRIVER_NAME,
+	.probe          = tc956x_gpio_probe,
+	.id_table       = tc956x_gpio_ids,
+	.driver = {
+		.name		= DRIVER_NAME,
+		.owner		= THIS_MODULE,
+		.probe_type	= PROBE_PREFER_ASYNCHRONOUS,
+	},
+};
+module_auxiliary_driver(tc956x_gpio_driver);
+
+MODULE_DESCRIPTION("Toshiba TC956X PCIe GPIO Driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("auxiliary:" DRIVER_NAME);
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
