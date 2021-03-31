Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FB834FB8B
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Mar 2021 10:29:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68415C57B5E;
	Wed, 31 Mar 2021 08:29:30 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ACB18C57B54
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Mar 2021 08:29:28 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id h3so14000923pfr.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Mar 2021 01:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=GeaHQT584yJS6al/D36INfw/UWOuETaMHBUlhwpXItw=;
 b=VcfHHqi9f0y4MFgC5bZrE+KiYMyVH2qWFzw3v7k5kiy0yQxGuQRUsvrLJE1LUpQIJ5
 a6aAO1w0BJ9VUbkmOhEcb+C0z/kH6MPc36u715MDWkPuYIpfKHBlFahNpjYOowmbdGI4
 /wlGkTy4iSkel1KXggsL9/v2nc61ZODHO3zpKpN45YAtjT2j8mHghdhtuId9plqHauTg
 w/nq8qgtw7dVeKTUrOFTLaHhayI+UqTQy6cvP7qQ5OZVTCgMq1ii7Ewx2SpuNgdRmXys
 RFtG/posXytKUrMClfkt+y/3N6z91DqJ8uCfFpWTfE7exl6gD66XgmIIOlSQdonWfcGl
 JVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=GeaHQT584yJS6al/D36INfw/UWOuETaMHBUlhwpXItw=;
 b=nfQZ++5hxP/luVCbYcWqwtZk5NJsO4hlGSWOZ6pYDUyfigHQ3ipIalYguDthaOgT+e
 8v/keotIdAbwUNbMLHcre1MkNfRt+f0GmchtGYQyhIazQO1OGKxVpXcHhNer72f798cs
 HjkWHxs52mVAmdTwhh2Xr5R6rffJ5bt2jzfo8Xt8WtWOWGbuF2tH3XjUYpcU6Bn7l9Xb
 qni0RgIJyKcGwXvpTOM2WTvADV4kiBEx0V8f/FQno6Hp88NqQTN90ZBbOr6DB0wIwqht
 Fr45Tt/6QDF2DqPKj6kto4nJF9ANDbKou7XgWmOKMcZjh0ERZUFV+6u1bovPV4/WckHm
 JPdg==
X-Gm-Message-State: AOAM5303b7dHq6HX1pOmnZ6ICGm0EATE1t2xpyENa1MMH3fDOD2ZQgeT
 rVtdlV4pUi4QiPqIqZTFQCE=
X-Google-Smtp-Source: ABdhPJwB7vaNXAVDacTO37U5OfOzmFEGWb5cs+DY68MHB9+uO3kj8ytq7mr2cNLvyJ4wyNdIO7e09g==
X-Received: by 2002:a05:6a00:2cd:b029:1f4:c3db:4191 with SMTP id
 b13-20020a056a0002cdb02901f4c3db4191mr1869209pft.71.1617179367324; 
 Wed, 31 Mar 2021 01:29:27 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id v1sm1420991pjt.1.2021.03.31.01.29.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Mar 2021 01:29:26 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh@kernel.org, valentin.caron@foss.st.com, Alexandre.torgue@foss.st.com,
 rong.a.chen@intel.com, a.fatoum@pengutronix.de, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, afzal.mohd.ma@gmail.com, gregkh@linuxfoundation.org,
 erwan.leray@foss.st.com, erwan.leray@st.com, linux-serial@vger.kernel.org,
 lkp@intel.com, patrice.chotard@foss.st.com, corbet@lwn.net,
 linux-doc@vger.kernel.org, pali@kernel.org, mchehab+huawei@kernel.org,
 andrew@lunn.ch
Date: Wed, 31 Mar 2021 16:28:45 +0800
Message-Id: <1617179325-6383-7-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617179325-6383-1-git-send-email-dillon.minfei@gmail.com>
References: <1617179325-6383-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v9 6/6] dt-bindings: serial: stm32: Use 'type:
	object' instead of false for 'additionalProperties'
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: dillon min <dillon.minfei@gmail.com>

To use additional properties 'bluetooth' on serial, need replace false with
'type: object' for 'additionalProperties' to make it as a node, else will
run into dtbs_check warnings.

'arch/arm/boot/dts/stm32h750i-art-pi.dt.yaml: serial@40004800:
'bluetooth' does not match any of the regexes: 'pinctrl-[0-9]+'

Fixes: af1c2d81695b ("dt-bindings: serial: Convert STM32 UART to json-schema")
Reported-by: kernel test robot <lkp@intel.com>
Tested-by: Valentin Caron <valentin.caron@foss.st.com>
Signed-off-by: dillon min <dillon.minfei@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/r/1616757302-7889-8-git-send-email-dillon.minfei@gmail.com
Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
v9: no changes, this patch was merged to tty-next by Greg Kroah-Hartman

 Documentation/devicetree/bindings/serial/st,stm32-uart.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
index 8631678283f9..865be05083c3 100644
--- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
@@ -80,7 +80,8 @@ required:
   - interrupts
   - clocks
 
-additionalProperties: false
+additionalProperties:
+  type: object
 
 examples:
   - |
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
