Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 91vfHRknV2pEGAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jul 2026 08:22:17 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 394A975AED6
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jul 2026 08:22:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=amarulasolutions.com header.s=google header.b=TpX+qGdE;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=amarulasolutions.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3813C7A83B;
	Wed, 15 Jul 2026 06:22:16 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1F37C7A83B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jul 2026 06:22:14 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-69c20ba892eso432381a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jul 2026 23:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1784096534; x=1784701334;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XAn+sgOJ//YpFHFCj3wQ7fJwCRmUnKUhDxx0gbmShJo=;
 b=TpX+qGdEjxUdQ+MOPHhynvCgXr5v6XULfOs5dZDRfnBngH4ZbY88pop0894B7boTXK
 twL3DcS/Nbs4xfOia94nirXGNzPqwUV3PjyTxrmmicRdRBXytETAOGAkpdV0BbgFFz0A
 rXjDpPM4BfHHey92/AcRA0E9T/lr5shCcmasY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784096534; x=1784701334;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=XAn+sgOJ//YpFHFCj3wQ7fJwCRmUnKUhDxx0gbmShJo=;
 b=f56Cd5HJbFWoa2Tu/C12pIi/79tc5vTJFAfUsAwYOUML16CEhPSmM49AnUYdXZ8XKN
 oCFGt28lcynqR8PhWgAltKyAciVDuXp01uADsCXT01+8SkFHfkd2pvp2Q76PJC+pPLG3
 fVWesDJOo/54Bmp7/oulzqrcvX6dQlbvZiljZ/RI8hWcCfrYI9HGvwZ9ABFzY+nMsVS9
 6gEnWWV4v+djEPxb64NallEQADgpBOH82UZVc6SefFdfL8mWXvg3YEKmeInmr5WI2wBf
 RMSNPi0HdX/AiWxMP/DkXtx9ctxG5oGbsXGZzvp8rcTwe1Cf4FzesIa7yyt923Nd77BT
 YuBw==
X-Forwarded-Encrypted: i=1;
 AHgh+RokGRS27eP1vD6wfBJzAUhHbpyntgfE/w3d56hH477mU8wDM6gEhUiyjeFy2mqT9aiM7m+LmvJ/VjNUzw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzApyL9TdUj+bUx3Jn4ZkptR9EDz1kbp7VgVIaoQmF/+FoDwsmw
 pb3FWRN42e4cQV3HzkU4SF5keHcBMtOvPpCmFuVAAQVgZFyjVCIWkSazFfo1p0QfOms=
X-Gm-Gg: AfdE7cm8vGsb6+WhF3WUI+XFnt+6Ehxc/oPE30Qq/miWOK4IvZgDRg8H7rTRRBKENp2
 l5qddBS0862HiA1xb/GeMWx8PdWEoLwTSz9d2U45t7sf066JdUN5+I2ToceZJtGpPXSDVC47ZhL
 GbCrUfqVCCvyjHUdLuj/puvdMWgVRIyEe7O6WtjG2+QefoQZ0DOdwvX1ae9pxM2u+zcf7LU2xhe
 qrjamfVl2C4do2sT1euwCeWde7H3xCaJ+hwe/zkyu1EUvGolTQ0wf3hpVGX8IYMi+O510MDHkA/
 vQQtWME/g9XJ1XuzlZxF381J781c+Z8tdQwNLT6ncMCEPrk0nzmSLLZ1wkkZxIQ55D21Ncmt1Lq
 MksMBp+tE9X2bgoNKKeVltIgJAT6H9T7GZqU0DssbwM7CceiykHxnlvx/VHFZWQUyEGQxu4f+e5
 0PGen4A+AvdJvpPZxDVQeRP9xazSKR++vWXCEdTtMy8wXo3otuLIHeGujyiWMDDCXf0QpDRavcl
 COxfEgGbUv8
X-Received: by 2002:a17:907:9610:b0:c12:4133:39ba with SMTP id
 a640c23a62f3a-c161ea2ad17mr949555566b.26.1784096534178; 
 Tue, 14 Jul 2026 23:22:14 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.41.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c15d0c3cf1esm1028820366b.44.2026.07.14.23.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2026 23:22:13 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Wed, 15 Jul 2026 08:20:18 +0200
Message-ID: <20260715062201.3599458-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
References: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 devicetree@vger.kernel.org, francesco.utel@engicam.com,
 domenico.acri@engicam.com, Conor Dooley <conor.dooley@microchip.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RESEND PATCH v7 01/16] dt-bindings: arm: stm32:
	support Engicam MicroGEA-STM32MP257-RMM board
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
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:dario.binacchi@amarulasolutions.com,m:devicetree@vger.kernel.org,m:francesco.utel@engicam.com,m:domenico.acri@engicam.com,m:conor.dooley@microchip.com,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:michael@amarulasolutions.com,m:linux-amarula@amarulasolutions.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,amarulasolutions.com,vger.kernel.org,engicam.com,microchip.com,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amarulasolutions.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amarulasolutions.com:from_mime,amarulasolutions.com:email,amarulasolutions.com:mid,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stormreply.com:email,stormreply.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 394A975AED6

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
