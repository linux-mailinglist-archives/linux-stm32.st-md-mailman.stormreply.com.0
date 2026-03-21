Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Ct2LGbyvWmMEAMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 21 Mar 2026 02:20:38 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4803F2E2C51
	for <lists+linux-stm32@lfdr.de>; Sat, 21 Mar 2026 02:20:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1BABC87ED5;
	Sat, 21 Mar 2026 01:20:37 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19C54C87EBD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 Mar 2026 01:20:35 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-439bcec8613so756916f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Mar 2026 18:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774056035; x=1774660835;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t13zBT/T6/lDXSt7yrtbcb88tX0zdjCe4g/9CVLLbBg=;
 b=Vf9m/pLiaQlaDcVApzAJvdOJ1SBmI9HRgyi6uiKy/575S6d3QpYXiriSITYaKBvsRs
 fpVZdK4S5rY0gwGtfYtpmkxApQWRWezwGj62kDPdQIhhMYll46o/FrWs4oGRDR+c6GBx
 0f4Qlr7Vagdyg8Wz2Kdsqh6vlIYxRZosGRRXABS2gtUSOnDGeytNYgu3gsqWUyr6Upw+
 ALUIBhG/vzveODMEJkFmp1+JuASB/CLO2GyoRI/fgyPG5bkJjPwh3Q8rpZBMB/6YjlQJ
 AkXPimZ+8z9cz11+RDTWzbR+aNeDVmVwP1TQePsMjj6Vkol1XIo14yJub+leTOJfPA1C
 z/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774056035; x=1774660835;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t13zBT/T6/lDXSt7yrtbcb88tX0zdjCe4g/9CVLLbBg=;
 b=G2o8ZT4/KfEIy+9YIaWRSQ8muyovgrm+CgMboZSIr5+2e9faF8ld1Gyil8jpgRwfA/
 NrNegPCgUrvv1eT6rs4kzUIgEKZbf4m9X5H0UWkWMaT5XCpQsJnuU06B8oI68TWQPAFN
 IoNxprs8R9b6tQqoL/g5SbmffKtu2U/zAkLnlsPriTvd475dkEuqVRAZdPaXwNRb8/ap
 YIyROrsXwj38I/HPV4fLc4vjszejrqdcF4ee/6YMUrc/3qsxHEf1DLCNBb2UriEMhttr
 xZfHtgYznOpjE6VqkOtDoxtOOFzHDlBTUm7OpwCuZXjVTECzUn92KZdtEtFTQzLfsFe+
 1lJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaqfdJcfmehfeNTo/n5WcGWLnWbSZP6uzw5xyAPcPP/yXYfbJBejY3DavhdP+lA9e34JrmaWqygYqu/w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxWUmv0kOapxeF4fYzCHqj/yqP3y55aMw2bRnrL5NXn6BU4FXM+
 YUAfiC8QIatL6UIKUkyLr9XsUD++2x5PuOTa47lRFt1hKzTSE0SaD4k=
X-Gm-Gg: ATEYQzySiJU0rBJHKh8LkJPZV+4wNyu0/f3XhGGmQf+iOoO48gQ4HgVJtu0WWuoHYBK
 yjYAyIQtugGJHI6+z3ZjZbiiH8IUk0wRa904fvSOad4Kcyv4K+56A4glG04ydwbDbfZ1wK9BdDv
 /5bpsaKM8gVyTx6BzTfV2DcWGc/USAUesBgP5XdSwWWipnWxIxxhXwtF3YpUMC6Lnp3kBb8SO+w
 7+pH0nFrAPsYjKOR3z8xMUB/PF3AlUlvOQjF19k+f7m1Xz9Qe5VTHveNIqVfuT9Xx8AtdtKNKdj
 C4FSPZnfO27mb4ZE2FFZSbG8gd7fjE3kamTEXHyobgYuspfHk3d5UOjEmyMMDAYTxIsW90YXEtx
 QyurJjwEw9pm4g7bUvj3BUy3Tis0TZd4VkupEo0epGq4r8XLMja/zDtqaXOxXYO4PUKyjtJX5Dj
 5TWf0Koz+O7Dymp7592Wu5sJ6zFYCVRCzuJ+T70tL/
X-Received: by 2002:a05:6000:2dc2:b0:43b:6352:a262 with SMTP id
 ffacd0b85a97d-43b64286a5amr8476539f8f.41.1774056035153; 
 Fri, 20 Mar 2026 18:20:35 -0700 (PDT)
Received: from localhost.localdomain ([37.166.81.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b647036e0sm11091605f8f.21.2026.03.20.18.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 18:20:32 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Date: Sat, 21 Mar 2026 02:20:11 +0100
Message-ID: <20260321012011.125791-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 jihed.chaibi.dev@gmail.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org, krzk+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] ASoC: dt-bindings: stm32: Fix incorrect
	compatible string in stm32h7-sai match
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[];
	FREEMAIL_TO(0.00)[foss.st.com,gmail.com];
	FORGED_SENDER(0.00)[jihedchaibidev@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:olivier.moysan@foss.st.com,m:arnaud.pouliquen@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:jihed.chaibi.dev@gmail.com,m:lgirdwood@gmail.com,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:broonie@kernel.org,m:krzk+dt@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:conor@kernel.org,m:jihedchaibidev@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jihedchaibidev@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 4803F2E2C51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The conditional block that defines clock constraints for the stm32h7-sai
variant references "st,stm32mph7-sai", which does not match any compatible
string in the enum. As a result, clock validation for the h7 variant is
silently skipped. Correct the compatible string to "st,stm32h7-sai".

Fixes: 8509bb1f11a1f ("ASoC: dt-bindings: add stm32mp25 support for sai")
Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 Documentation/devicetree/bindings/sound/st,stm32-sai.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
index 4a7129d0b157..551edf39e766 100644
--- a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
+++ b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
@@ -164,7 +164,7 @@ allOf:
       properties:
         compatible:
           contains:
-            const: st,stm32mph7-sai
+            const: st,stm32h7-sai
     then:
       properties:
         clocks:
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
