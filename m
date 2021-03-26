Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 092F134A63E
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Mar 2021 12:15:46 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C193DC58D5C;
	Fri, 26 Mar 2021 11:15:45 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0C71C58D5F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 11:15:42 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id q5so4642351pfh.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 04:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ioUVrq22UmzpyRrEEDvYTk5HDeFP8YOT2+8IMC1K0uU=;
 b=gOD0I1pRNyONW/xXRl8dt4+/st8jADont9iazDC7dfBAmcLVSkyP7ZxJRBC/1yQJwv
 6RuuOnOkW/y3Uwe/+oPyOnNNazrl/J+T8CVzj0aMqY45VNnx57iqcE/PZKCYWSgOOkiK
 0jXg3c6Cm8/VGgmxv4r/k2teNmy8CcpoJxmrAkdJrgowzr5i9Z/G7xZnqDujszYPqvj5
 PqvTycRBP0A2nME6Am7yCVvZbgL/tdeU5tWyh78hMNhzhPeVksadfs2QC41U6BTWng38
 jDmn209/l8FeuIziDqamX8ZG/N+f3gyxECGcAJsHdZqM0Qw6uGRDkdO98g1dTJWg1VrJ
 2B0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ioUVrq22UmzpyRrEEDvYTk5HDeFP8YOT2+8IMC1K0uU=;
 b=kZF1joPhyur1+uoRMWdtJ/t0i7ZsCUrZn5w2wBf6q1OqYaqYoBuV2NnzYZYhNC2nI+
 puAkVj9AZ725+mDFXvqADi846GFvubv52y6c4Jn5tHtVN/0/9bWPwOfm846Vl8eFgrH0
 bvWK7pl1md6LGFa4Hm0gryozKCddA7ip81EG92RHiZTtgW2LPUwCIvE6fRzoW3Tksgzi
 uTnTkUwbMFwxPt9DKTw7EgrWmM+tRH+2IN7LuzagXbmwWu3UEQrbUwOp2wXmwCeZP3wY
 WepjbIcgCQuLwMfOAe9QFN5+ORLo8uVYLI0YSVC0GxNA8xcmcu7Divbi9tybpel2WpSc
 K23Q==
X-Gm-Message-State: AOAM530EHyWeBOb5Ipu69wQljfVzSfNlO7vxZzc9Rq2dnVa6QovoCDyp
 t0NVOYY2CFsMes/YuvMpR58=
X-Google-Smtp-Source: ABdhPJygZqLH08IY9AUgbpjaTPpUsohQHVfAon9iSpi97ZOyGUyiIvy5UmRVEtvAdDxc0CVKKiwpKQ==
X-Received: by 2002:a62:bd03:0:b029:21d:b680:db15 with SMTP id
 a3-20020a62bd030000b029021db680db15mr11940509pff.25.1616757341247; 
 Fri, 26 Mar 2021 04:15:41 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id l3sm8108414pfc.81.2021.03.26.04.15.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Mar 2021 04:15:40 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh@kernel.org, valentin.caron@foss.st.com, Alexandre.torgue@foss.st.com,
 rong.a.chen@intel.com, a.fatoum@pengutronix.de, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, vladimir.murzin@arm.com, afzal.mohd.ma@gmail.com,
 gregkh@linuxfoundation.org, erwan.leray@foss.st.com, erwan.leray@st.com,
 linux-serial@vger.kernel.org, lkp@intel.com
Date: Fri, 26 Mar 2021 19:15:02 +0800
Message-Id: <1616757302-7889-8-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616757302-7889-1-git-send-email-dillon.minfei@gmail.com>
References: <1616757302-7889-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v6 9/9] dt-bindings: serial: stm32: Use 'type:
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
---

v6: no changes

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
