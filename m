Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A40812147C3
	for <lists+linux-stm32@lfdr.de>; Sat,  4 Jul 2020 19:42:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64B49C36B24;
	Sat,  4 Jul 2020 17:42:41 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26436C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  4 Jul 2020 17:42:40 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id e22so30604963edq.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 04 Jul 2020 10:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s+WjqQhLnrBI9EZzuDqm8X/T4+BDu4Hvw8Pd6T2GP/0=;
 b=bGJue6eFu/VA4Z82viDrc/TOb1htLvh2SOgSDczNVO7YU7sdfkKY28+EU8afJih10q
 0N8YaAE/AmpRF6dp640fwh2aIEClOc56Zzav7IhwuCCIQMXGV6if3oeuYbKBWQu+ttlB
 QSXNrork0ZteL5K5kxxc7oaaLoWxaN+xARlgoWRL6Cuv64rfoHyjMh980DsyvOLaynjR
 K0UgWIugk+qbiApkZC9cKu2BfujP19Eu3jtymgrqJhYJR56xXgK8r/UgIHYnVhr8myrp
 bd3Bb7hC2Gjq8H1hERABJXPPmgiFQpOD12As09QpFCPPWdVI1psRm4k36AKXbOJ5vNxk
 EXYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s+WjqQhLnrBI9EZzuDqm8X/T4+BDu4Hvw8Pd6T2GP/0=;
 b=lmmZWq5ToVLI9fX8GPaEphiiv1fqwHOxgcrhLuOF/1I58QXc8IVGMqMs1kaP6YmFRj
 pvpch4tzJIB/f23YcLvr2r+iL+/1v1AMpjwfpYBmEUIHbzJN2rzSeZ4GvcOF9GT9+3Cn
 5BbPc6pMU1cl4O9xCoBT45ZXtTAb2XpdVlw9qNf96H53FWrf94n31tsuHT0x6hC4Qtfd
 A/41XoYt8+/gBtkRqb3XbDxcU/pnhmu3xTwHi7ODh/q1kKv7mI032r8DWFZ/QUTeiBoZ
 lyJHffaB/ciJPpuMqLcmm4JIJQw6GUt58i+HjfQLLovKf5iMUxLYI6VmzoGXkxjogUUU
 hY8g==
X-Gm-Message-State: AOAM530JcumIk+AmAarpXXXMiSxZpUH3GgowNGm0jEqA3q05VZ7sybGs
 aPvSdQf7QmhS8lyKoG2o6S8=
X-Google-Smtp-Source: ABdhPJy0vTlYXslUqGyC33YSMiLi8X29/Je6nWzHxrmFVdZsP3IEJRoSrq69lLr/vXKxSdAkeSt+Cg==
X-Received: by 2002:a05:6402:2c2:: with SMTP id
 b2mr46631661edx.184.1593884559571; 
 Sat, 04 Jul 2020 10:42:39 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f137244200428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3724:4200:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id f17sm17671650edj.32.2020.07.04.10.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 10:42:39 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: amelie.delaunay@st.com
Date: Sat,  4 Jul 2020 19:42:19 +0200
Message-Id: <20200704174219.612060-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200616140717.28465-2-amelie.delaunay@st.com>
References: <20200616140717.28465-2-amelie.delaunay@st.com>
MIME-Version: 1.0
Cc: balbi@kernel.org, devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 mcoquelin.stm32@gmail.com, hminas@synopsys.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] usb: dwc2: override PHY input signals
	with usb role switch support
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

Hello Amelie,

thank you for this patch - I am hoping that it will help us on Amlogic
Meson8, Meson8b, Meson8m2 and GXBB SoCs as well.
On these SoCs the ID detection is performed by the PHY IP and needs to
be polled.
I think usb_role_switch is the perfect framework for this on dwc2 side.
For the PHY driver I'm going to implement the cable state using the
extcon framework and then having a new usb-conn-extcon driver. This is
just to give you an overview why I'm interested in this.

[...]
> +static int dwc2_drd_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
> +{
> +	struct dwc2_hsotg *hsotg = usb_role_switch_get_drvdata(sw);
> +	unsigned long flags;
> +
> +	/* Skip session not in line with dr_mode */
> +	if ((role == USB_ROLE_DEVICE && hsotg->dr_mode == USB_DR_MODE_HOST) ||
> +	    (role == USB_ROLE_HOST && hsotg->dr_mode == USB_DR_MODE_PERIPHERAL))
> +		return -EINVAL;
> +
> +	/* Skip session if core is in test mode */
> +	if (role == USB_ROLE_NONE && hsotg->test_mode) {
> +		dev_dbg(hsotg->dev, "Core is in test mode\n");
> +		return -EBUSY;
> +	}
> +
> +	spin_lock_irqsave(&hsotg->lock, flags);
due to this spin_lock_irqsave() ...

> +	if (role == USB_ROLE_HOST) {
> +		if (dwc2_ovr_avalid(hsotg, true))
> +			goto unlock;
> +
> +		if (hsotg->dr_mode == USB_DR_MODE_OTG)
> +			/*
> +			 * This will raise a Connector ID Status Change
> +			 * Interrupt - connID A
> +			 */
> +			dwc2_force_mode(hsotg, true);
... we cannot sleep in here. the call flow is:
dwc2_drd_role_sw_set
  spin_lock_irqsave
  dwc2_force_mode
    dwc2_wait_for_mode
      usleep_range

> +	} else if (role == USB_ROLE_DEVICE) {
> +		if (dwc2_ovr_bvalid(hsotg, true))
> +			goto unlock;
> +
> +		if (hsotg->dr_mode == USB_DR_MODE_OTG)
> +			/*
> +			 * This will raise a Connector ID Status Change
> +			 * Interrupt - connID B
> +			 */
> +			dwc2_force_mode(hsotg, false);
(same sleeping issue here)

[...]
+int dwc2_drd_init(struct dwc2_hsotg *hsotg)
+{
+	struct usb_role_switch_desc role_sw_desc = {0};
+	struct usb_role_switch *role_sw;
+	int ret;
+
+	if (!device_property_read_bool(hsotg->dev, "usb-role-switch"))
+		return 0;
should we also return early here if dr_mode != "otg"?

[...]
@@ -532,6 +534,13 @@ static int dwc2_driver_probe(struct platform_device *dev)
 		dwc2_writel(hsotg, ggpio, GGPIO);
 	}
 
+	retval = dwc2_drd_init(hsotg);
+	if (retval) {
+		if (retval != -EPROBE_DEFER)
+			dev_err(hsotg->dev, "failed to initialize dual-role\n");
+		goto error_init;
+	}
+
 	if (hsotg->dr_mode != USB_DR_MODE_HOST) {
 		retval = dwc2_gadget_init(hsotg);
 		if (retval)
I think dwc2_driver_probe() needs a new label (for example named
error_drd) which then calls dwc2_drd_exit. See [0] which I have
submitted as a patch for Linux 5.8, so it's not in usb-next yet.

Also in general I think you need to submit a dt-bindings patch that
documents the usb-role-switch property. Personally I would use
Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml as
reference for that.

Can you please keep me Cc'ed on a v2 because I'm not subscribed to the
linux-usb mailing list?
I am going to test this on Amlogic SoCs - once I made "everything else"
work I can give my Tested-by as well.


Thank you!
Martin


[0] https://patchwork.kernel.org/patch/11642957/
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
