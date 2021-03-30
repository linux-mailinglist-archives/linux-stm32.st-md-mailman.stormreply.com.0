Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC1B34DE66
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Mar 2021 04:29:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80F0FC57B60;
	Tue, 30 Mar 2021 02:29:34 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0C9CC57B54
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Mar 2021 02:29:32 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id t140so3307754pgb.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Mar 2021 19:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JoG99J7INRpYRP07ioU0aX0n1p4zIOqkYI0fl0yVkzY=;
 b=oTZQcyFMGGMpCxxl3ssVEU7AGA7xOw4Lr6snuy237SRb5Wax+sp0e6pcJhCZ3mWTUZ
 LD/3t7z7HZ6vRsPTmCZb3nQ+ONQV8+JnYyRcjOr3ed0WqVMaSrtj9V2wed6pmJe8X0IJ
 zqXX12pThrfNGTId2hYIkARj+5jVdcC3Z0aM0ISUWVGJTuyJBQzvuoog58p40bVJmoFc
 WeoCy8tvoj2qJXdW/4LxeFtGnFqEj0cAAis8rbii23OMbQBExT7TjxRArz+SUfJiPTBp
 7wO9WlnBQQzHWYAknZKc7VOC5agDPpDAG3G5avM78xJs2ve2XlQWjW7MVdq2A3oTG8wO
 zSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JoG99J7INRpYRP07ioU0aX0n1p4zIOqkYI0fl0yVkzY=;
 b=X+4oK2I9pezup2o2s/2rVmK4NDDEz+5cb9w0l4O/ggZK+DZ7/02bZu17C3q8xZnJrr
 FPMAV4jFTOhiWT6tbb40kpUr9BJkoehfr8DibJhHsbHyLk5keZSSZ6BL04sjmgYpMXct
 dw/Oa4TKXljVhqr/4K2Q48sW5ZUzN0ja3X/AbtNkrMenJirwZgMu1xeWB/G7ZXxQVxzz
 ajMlDo57fC3b1aLV/aiy1qamJWS+jzY5L4Z6VlD1ClAnFSj/PYNmxcRo3y2iMlHttAg0
 KUEHBDWnweHy65qRc/W/Tqi79B72kPq1lafg8rHkJgAEeU4dFSMcej6BQf+cEQb9Gfw1
 MHXA==
X-Gm-Message-State: AOAM530Uduttd3k08UA64z0kFqc5zhiLxjl/EDd2v07/RMN3K0KhfAgN
 IGlF3Z3oeWriKhF3MSRKNqg=
X-Google-Smtp-Source: ABdhPJwilL2jw4bU/1idwK9Bl1VKCj2/sWv62/R+U/1Az6XtxNbOdTM6Hj0A0OtDWHH/exXmniX2aA==
X-Received: by 2002:aa7:93af:0:b029:1ef:1bb9:b1a1 with SMTP id
 x15-20020aa793af0000b02901ef1bb9b1a1mr28475386pff.49.1617071371305; 
 Mon, 29 Mar 2021 19:29:31 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id i13sm17681385pgi.3.2021.03.29.19.29.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Mar 2021 19:29:31 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh@kernel.org, valentin.caron@foss.st.com, Alexandre.torgue@foss.st.com,
 rong.a.chen@intel.com, a.fatoum@pengutronix.de, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, afzal.mohd.ma@gmail.com, gregkh@linuxfoundation.org,
 erwan.leray@foss.st.com, erwan.leray@st.com, linux-serial@vger.kernel.org,
 lkp@intel.com, patrice.chotard@foss.st.com
Date: Tue, 30 Mar 2021 10:28:58 +0800
Message-Id: <1617071338-9436-7-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617071338-9436-1-git-send-email-dillon.minfei@gmail.com>
References: <1617071338-9436-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v7 6/6] dt-bindings: serial: stm32: Use 'type:
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
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v7: no changes, was merged to tty-next by Greg Kroah-Hartman

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
