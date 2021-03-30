Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B857934E3AD
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Mar 2021 10:58:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80878C57B60;
	Tue, 30 Mar 2021 08:58:59 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B017C57B5B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Mar 2021 08:58:58 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id l123so11691426pfl.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Mar 2021 01:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=F9tSrsqSDZKawmCDjVV+tzhmJdPbgKPqMa/CwWx5jps=;
 b=C0EXNuAjqJ0RYeS2/x/rgzfMvYBNcw7W0kjMnzwTG3Uo4kuGO6m+vVr0bd09QrFmhO
 /GI6tMuLAxdgtMJAn49vD7jxqQFbEjGZVf7WDLiJt7p43hqdXP03jErWYqDoBtUiezhN
 /OmmOSIWHQTjljntLn7nveNxNhYaqd2c/hVfUbCREPF/j6LJ4Q6StVtS23DXrNKS6SzZ
 vW0i8WLRZdbF7bqcVdZZz1CQ/GRLo4W7KI5dpfGcxnvK90paeAz42woR5uU5ai20PmWR
 8+XQExdk2coXf1D+jE4e7Y864IaC9mdsvSGwrtTHCQZbPdzSuV8+JQvP8YS6N+OaefTy
 PFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=F9tSrsqSDZKawmCDjVV+tzhmJdPbgKPqMa/CwWx5jps=;
 b=gaRH6WQsg+F1mXn47aYcNHgMycmDqZGmDc8e2liv43qNslMKlv3URfE+uM+fOR2AUn
 SrH8/66VJRIAXhpII0v+DjY4LOcLh5zNu67plrHaVP/dNvr+7k6aI/hUofSSqVhW8f9V
 Dia5XB5xXLXn4HNhlwGTzQc8MLSSg8GqLPz1KIG+A9/mQULHf2txhPEKL4z1MTEeLAfd
 DqtyNlNtelOhZ3eHMUPx3GwfqIk5H9HMl4lo91nT/EpyVXwo6C1UCecSgPVCGJ7/M62Y
 Rhip/lzni94UhaexBHruYnmF2iWJi/5D5v0iewdKYTnKJE7QQVxXr89Llm/JMWEWDlQV
 xvHg==
X-Gm-Message-State: AOAM53372RZ04nkz8OvcGMFiuH7im7T7e8et6icT2l0K9cT3cSOXl/qq
 H9UOVOcrl+kqBPvV7aI6pSU=
X-Google-Smtp-Source: ABdhPJz4JEITEdJIKes5VdRLdLAriYxA0JWe625kgdkuzO430nqFP/o7RLuxlnIZtT/OtWNqDsHohQ==
X-Received: by 2002:a62:800c:0:b029:203:6990:78e2 with SMTP id
 j12-20020a62800c0000b0290203699078e2mr29079533pfd.3.1617094736831; 
 Tue, 30 Mar 2021 01:58:56 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id y8sm20952642pfp.140.2021.03.30.01.58.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Mar 2021 01:58:56 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh@kernel.org, valentin.caron@foss.st.com, Alexandre.torgue@foss.st.com,
 rong.a.chen@intel.com, a.fatoum@pengutronix.de, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, afzal.mohd.ma@gmail.com, gregkh@linuxfoundation.org,
 erwan.leray@foss.st.com, erwan.leray@st.com, linux-serial@vger.kernel.org,
 lkp@intel.com, patrice.chotard@foss.st.com
Date: Tue, 30 Mar 2021 16:58:24 +0800
Message-Id: <1617094704-10040-7-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617094704-10040-1-git-send-email-dillon.minfei@gmail.com>
References: <1617094704-10040-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v8 6/6] dt-bindings: serial: stm32: Use 'type:
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
v8: no changes, this patch was merged to tty-next by Greg Kroah-Hartman

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
