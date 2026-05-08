Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLeUNpYv/mmvngAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 08 May 2026 20:46:46 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B66A4FAC01
	for <lists+linux-stm32@lfdr.de>; Fri, 08 May 2026 20:46:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98D9DC87EDF;
	Fri,  8 May 2026 18:46:45 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC2F8C87ED8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 May 2026 18:46:44 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2b9ea536877so16124675ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 May 2026 11:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778266003; x=1778870803;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y8T4V1KOUS/zQQGD3wOEYFO7WBlAjbkL/PMKx62SumA=;
 b=XUx8JhVSHD+L2qjgngmXtUntfBlckCwBiCBZfT0M74TP7w+LRZftnmblN0Xmz59eqd
 ontSW4C431deWgBAicTCELkE0S3DNiXuhpoZ9N9S32huurAd/oRkPlReu0OhgxQ+MzHg
 2rlt4DL/gXPfuuWPuZ29UEO1cajlYXRgUlKKYjN4DKho6T4KsGLKl5DDxLLFEvuDCDUn
 t7qk+oDeuL4rWwrsM6gqJ5Jo3Ts69UMGtcezp4JgRPacwscYT55RCTozQd1OJEYS8MNp
 JZa7rZc7BNhY1JZbtLcR6LjzfsJ+t9Lr+eXHYaCw6hTF42L3qmHWgIvMP3RRxjb/anRM
 /VyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778266003; x=1778870803;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y8T4V1KOUS/zQQGD3wOEYFO7WBlAjbkL/PMKx62SumA=;
 b=rsRTaCSsDBUb3nySTKlLZGEHiKWoKLCsL4YUiv/4edSZNCCjDl34b3fNOKenc5CQK0
 6TNlfuxxYaYsXAUsEQqpfy4Njjhzwg4P/ni/J4Ofpn76DM9soO31GLQjjOHCKLbxCQuM
 s9l6/LyTQnImepdIlBUj+34Ox06k1WgjNkwdy8g9VCXhYF20iPW1lHNa7hYbeb+sB9j5
 YWjHGcccydY8TteakRSH3vM50LfA50ajFHqByv7qc5w8LjSAmOSqFY+SYyojsVoFHlq2
 0Ao4/bd80DIUo0+P7I5SHuJWr7X4UrvhJm/lNqCEc/JWjrTeQLwdIgXqBlqhDwYSmVFV
 TUxw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/JP9JEIv47sV6NeZjqHroclrT+IqKxgu+x3XDDr+XCcmgNmvxMEXJUgObeX7nsuKyo7rRSNQ8OIOcc/g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxtphGZyEVhfilTXf5ACpEy3q6p0Vu7nYrd6/wC1Z+n6H/oe6CU
 BuWk4iidpGlcbupEWQdHFU73PyosjBxydCrjEYQhz47TcatDxRNjmsPF
X-Gm-Gg: Acq92OG8WZpzFVNkSW0ZEH4RCOvvEcwwhNlr97/5yh+CZcCWVTv5jaVdygc+q6riaXb
 DVkuo4FL6LqoKWVf81UCndJRjy62tbq0jBWfyCuLhL0uQSqOLsIYIl5qGeTMXE8dFNfF7srvTMG
 X+l/uwb097pnPPpg2DFE/t+u1pXGKu7AxcMARcRQqImewvpTJdFQPgEValka1l8kDUNE+n62Q3o
 WS/ENebEesLhlwsz2KZ/QFrVdNwQqOHs3WrZrWDZUKCNJPO+SgmH0bhL+LFbohNIZ3JFJwZztBD
 VRqcl2NGKMHeP7MeAT/XfHIbWeWid9vToBeuvGANPX2+59lYzMiI0OMItmjPeo/az2Ir3y08AY1
 IG8DR/tfauWYlm4UvfIrBvbD1nRuvkeQd5G/H2p0l1aoaGxTdaAX4SYTXOmxKTHh2SLp+YAIR0H
 YvRCYCRl8CiZ2+Bz8zfIPrQEnZ/c82dfqkuezFEQ2BoXc88N62rtu+MVrClJmEtI81m+0=
X-Received: by 2002:a17:903:2f46:b0:2b9:6cde:c345 with SMTP id
 d9443c01a7336-2babd4a4742mr76227935ad.18.1778266003085; 
 Fri, 08 May 2026 11:46:43 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.172]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2baf1e89d43sm30926035ad.63.2026.05.08.11.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 11:46:42 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: ukleinek@kernel.org, thierry.reding@gmail.com, linusw@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Date: Fri,  8 May 2026 18:46:26 +0000
Message-ID: <20260508184626.15938-1-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, manishbaing2789@gmail.com,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] dt-bindings: pwm: stmpe: drop legacy
	binding
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
X-Rspamd-Queue-Id: 6B66A4FAC01
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ukleinek@kernel.org,m:thierry.reding@gmail.com,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pwm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:manishbaing2789@gmail.com,m:mcoquelin.stm32@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:thierryreding@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[manishbaing2789@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manishbaing2789@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.927];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url]
X-Rspamd-Action: no action

The st,stmpe-pwm binding is already covered by the MFD schema
Documentation/devicetree/bindings/mfd/st,stmpe.yaml. Remove the
obsolete and redundant text binding file.

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
Changes in v2:
- Drop the TXT file instead of converting to YAML, as the
  functionality is already covered by st,stmpe.yaml.
- Update the commit subject and description to reflect the drop.

 .../devicetree/bindings/pwm/st,stmpe-pwm.txt   | 18 ------------------
 1 file changed, 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pwm/st,stmpe-pwm.txt

diff --git a/Documentation/devicetree/bindings/pwm/st,stmpe-pwm.txt b/Documentation/devicetree/bindings/pwm/st,stmpe-pwm.txt
deleted file mode 100644
index f401316e0248..000000000000
--- a/Documentation/devicetree/bindings/pwm/st,stmpe-pwm.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-== ST STMPE PWM controller ==
-
-This is a PWM block embedded in the ST Microelectronics STMPE
-(ST Multi-Purpose Expander) chips. The PWM is registered as a
-subdevices of the STMPE MFD device.
-
-Required properties:
-- compatible: should be:
-  - "st,stmpe-pwm"
-- #pwm-cells: should be 2. See pwm.yaml in this directory for a description of
-  the cells format.
-
-Example:
-
-pwm0: pwm {
-	compatible = "st,stmpe-pwm";
-	#pwm-cells = <2>;
-};
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
