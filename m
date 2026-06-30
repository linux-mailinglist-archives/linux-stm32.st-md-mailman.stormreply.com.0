Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MLJOGdGLQ2okbAoAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jun 2026 11:26:41 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A9E6E2238
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jun 2026 11:26:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=amarulasolutions.com header.s=google header.b=UCmOuvV1;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=amarulasolutions.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DF57C8F278;
	Tue, 30 Jun 2026 09:26:41 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D819C8F281
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jun 2026 09:26:39 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4903d730b1fso52798205e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jun 2026 02:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1782811599; x=1783416399;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XAn+sgOJ//YpFHFCj3wQ7fJwCRmUnKUhDxx0gbmShJo=;
 b=UCmOuvV1SBYGoRAsvpM+ZFOcN3OPkD9WxBa+lNgzAOlFZ1jpthnbEYfcg07BupgVzh
 CxAE3acaxeYGt4PYKbqhFkA7iym44Kz5cksvt8F9NKkyEFXGQLh+dx8JEJrCalSHRRCB
 +VsqbwZ+Ry+Ap1vsXLzZkWvOad/Rk2SBxQ/qk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782811599; x=1783416399;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XAn+sgOJ//YpFHFCj3wQ7fJwCRmUnKUhDxx0gbmShJo=;
 b=m4YDLPogyL1Qu3RKl3D3kqVRfxc7elrPWWCL/5/srqF1AIRsUEHiRf+4MPMA5hLtwo
 cSPvxBRo9rP2SBkp44MkD+uxTVMR/cy6Gkk4RHn1gN1WRxYG3KqsYIAHHKur5MXcLb1j
 Mvi7neZtFbpFztFXoxjtK6PFNlIn2HHlWCsD9uX14dwXHaoycQLpJiHPqJ1JRHlETXqk
 F2OHH3cHkZ7PcVxuxJ/pXUPdbun2I3joOhTHx/GUPr7EZDNgTGOS/8GW5yiaHzGmS5+4
 /2zMV1CxQH1yUt4XziQ4iYFf2G3m0SAYD1CvooNflZNHOlDXt/4EyBHoJWwbKtpLK5nA
 rSzg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/bB9paCTCVVhd9SXqZkp0bJU0flKrO1IwpVsFrtqxAzMEUfkVLhsa6wqMptYR5uHB7eTytPTfr10BVtw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxPBh2WzfHIFCbcZkWSt9q/hMQsZyoQm4cxzPxQTr5VKyRZwc2X
 +yBOcYE+vB3dZ8ng4ylAm/XdHQbPFZwEaJK81VgQMzTcFZO+8YbgYgzixIE6joA3mnM=
X-Gm-Gg: AfdE7cnd/9NwB+z9BxfnFFJXVAVcFWMZt6AnPwJ8U5Fqdq3Foy/MCs7TFMqw5RPAVqJ
 eXwbX74e4JdL88YKIb8IbcbxBS7bqxDOAubcPETTiOG7TuS6WqEryZxEtlYERsk7ur4YN4V+NEi
 WDXtsj/Idsj9/vaAfu8GvJd/EWAiyfZk7a+aypKD4PG6yyTpIn9t26oNIvvmqdhTDb5TLljldBX
 ur5HHf7z60378LB31A6t3ptkroI6lW6XOS3QCo3xORhG/X7yH8IevT/QtZX2aomltT5oJRXh6zG
 G7NG8MBgY0YKHzeFO5PL4nLrfX8uQLER+y9W9fN9pQliaonqD1Kyj/mvWJUUnZbxg4XRIK8NePI
 rxnXC9LP/9qaSa0PE6+chDeIgxjaQOrdIM/YmUsTnOxpjL8NEX4Rzxhgiqo46h5rJpSkNZkdibq
 OkxJ9t5aHasq4WT0egIkwXnaF0DYI6TCfQbSS7CYENZMTtZ42D9jPnUh347zfP5GSPlIb+FaWhH
 RhSrHK4bnPaJPN6917xiOS00eUkICqMfyIop6pV5gN1kLW4qWEX68QO3cRlItR689PlChjNPtOy
 47l4xSkhY53vMGI6/BO4fH7Q
X-Received: by 2002:a05:600c:6218:b0:493:a7fd:15d6 with SMTP id
 5b1f17b1804b1-493b8289c5fmr45013735e9.9.1782811598900; 
 Tue, 30 Jun 2026 02:26:38 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47567a6f0ddsm5669083f8f.37.2026.06.30.02.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 02:26:38 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 30 Jun 2026 11:24:30 +0200
Message-ID: <20260630092628.1695560-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
References: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 devicetree@vger.kernel.org, francesco.utel@engicam.com,
 domenico.acri@engicam.com, Conor Dooley <conor.dooley@microchip.com>,
 Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 01/16] dt-bindings: arm: stm32: support
	Engicam MicroGEA-STM32MP257-RMM board
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[amarulasolutions.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[amarulasolutions.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:dario.binacchi@amarulasolutions.com,m:devicetree@vger.kernel.org,m:francesco.utel@engicam.com,m:domenico.acri@engicam.com,m:conor.dooley@microchip.com,m:himanshu.bhavani@siliconsignals.io,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:michael@amarulasolutions.com,m:linux-amarula@amarulasolutions.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amarulasolutions.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,amarulasolutions.com,vger.kernel.org,engicam.com,microchip.com,siliconsignals.io,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,amarulasolutions.com:email,amarulasolutions.com:mid,amarulasolutions.com:from_mime,microchip.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 43A9E6E2238

Add devicetree bindings for Engicam MicroGEA-STM32MP257-RMM board based
on the Engicam MicroGEA-STM32MP257 SoM (System-on-Module).

The use of an enum for a single element is justified by the future
addition of other boards based on the same SoM.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

---

(no changes since v2)

Changes in v2:
- Add Acked-by of Conor Dooley for patch 0/1 "dt-bindings: arm: stm32:
  support Engicam MicroGEA-STM32MP257-RMM board"

 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index c6af3a46364f..c5ce81e3ce45 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -203,6 +203,13 @@ properties:
               - st,stm32mp257f-ev1
           - const: st,stm32mp257
 
+      - description: Engicam MicroGEA STM32MP257 SoM based Boards
+        items:
+          - enum:
+              - engicam,microgea-stm32mp257-rmm
+          - const: engicam,microgea-stm32mp257
+          - const: st,stm32mp257
+
       - description: ST STM32MP235 based Boards
         items:
           - enum:
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
