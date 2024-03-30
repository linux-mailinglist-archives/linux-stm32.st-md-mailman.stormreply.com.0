Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA366892C3D
	for <lists+linux-stm32@lfdr.de>; Sat, 30 Mar 2024 18:58:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67997C6C855;
	Sat, 30 Mar 2024 17:58:41 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B176C69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Mar 2024 17:58:40 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-41558d2a06cso3484665e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Mar 2024 10:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711821519; x=1712426319;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QuHz7NbYphgsBERKb7Gi6jBAyiMkVdvzVzWkI73/WU8=;
 b=o1MPxUls9r2fsr7BIT2jjnit5w1bAAPc9ev7z05oTiZUWfMG4Tfw8qDjJODqLGgno9
 L3tw6I3bmWKBHjRb1Z4KbPTtSi0YKxtm97mAfWbeUmX/DINA54GBu15SF4+DeJjqGfPv
 s4ZLa8/gDHYZUzjc6Uol4kSg4vlOsSqDbpBYIOHkma1tHniS6T8NZE7s9+AKfTEyN58p
 vjTAifo6V0fX3aEsuh10PQY132yzzROpSido7sP2DdwliKyO5KDqL7yTqcD0OyK+/Gnp
 WLv2hJ1q8KT4d8m9fSEp9IbJqvI5KS4NokGLZazsCFTxS8GfPuBEutZjTepSS04uA6r4
 lDWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711821519; x=1712426319;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QuHz7NbYphgsBERKb7Gi6jBAyiMkVdvzVzWkI73/WU8=;
 b=ZyvAdB2hIPGYEPJfd3pjtSD9Q4w+Nr5nRah6ULVJpZ5jC4N+f9A69furaIm9hQFVpV
 I1wXzNXhZvmbj1OT2Q7gKpr8/H99Lnc5A0xnQXswq/H83thXro4RenQxKCIDay9BtULo
 eGCvPNYEJcK9uHBE3XbVfEUWmrcL+tNGN3X/yFLHixi/iy1G4Y2sgp1ROrhighE9354F
 xG3z+iW514g0wCy/dprl3M5t3a9QQ7wGK6LwZq1xX3fiVLbrkuwxA3Rgzn3WgJrkQoRu
 +heJmuoWtPXiFw87j2sUsCzVu61V9BCszm2tC1kv3miUsgtViIo1JILqCqX+rtERi8sh
 fjKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9AzRpEVJXFR27PN9x8/nLuixnZcPblG75QH6lLLP59lqnvzHCv5N3uU5dBrzkX2qIYHJ5xCwlNXoxs/t6toE3VWqftIvL/87uuQrTeEls1hLxMheniqyj
X-Gm-Message-State: AOJu0YxAcb1v9F7ozyK7F7OzDrMxcLVMkIiYGuhBtD7cGVbKzlJX7VOn
 ceefRyP4q1mhUvtZ1ZK9rzkQUDcbL6MKRr+LrwXIOOURQz3Jzk7arHPQ6o8G3cA=
X-Google-Smtp-Source: AGHT+IGqlMz1alWRKxGaognRF10drFVQxV6mNURT1OgHL5DqwKDRbiiGAjlSz2Ygixur7KvLK2brog==
X-Received: by 2002:a05:600c:5349:b0:414:8065:2d23 with SMTP id
 hi9-20020a05600c534900b0041480652d23mr3858145wmb.20.1711821519529; 
 Sat, 30 Mar 2024 10:58:39 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 o41-20020a05600c512900b004149536479esm9235312wms.12.2024.03.30.10.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 10:58:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Russell King <linux@armlinux.org.uk>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Vinod Koul <vkoul@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>, Eric Auger <eric.auger@redhat.com>, 
 Alex Williamson <alex.williamson@redhat.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
Message-Id: <171182151736.34189.6433134738765363803.b4-ty@linaro.org>
Date: Sat, 30 Mar 2024 18:58:37 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13.0
Cc: kvm@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 00/19] amba: store owner from modules with
 amba_driver_register()
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


On Tue, 26 Mar 2024 21:23:30 +0100, Krzysztof Kozlowski wrote:
> Merging
> =======
> All further patches depend on the first amba patch, therefore please ack
> and this should go via one tree.
> 
> Description
> ===========
> Modules registering driver with amba_driver_register() often forget to
> set .owner field.
> 
> [...]

Applied, thanks!

[01/19] amba: store owner from modules with amba_driver_register()
        (no commit info)
[02/19] coresight: cti: drop owner assignment
        (no commit info)
[03/19] coresight: catu: drop owner assignment
        (no commit info)
[04/19] coresight: etm3x: drop owner assignment
        (no commit info)
[05/19] coresight: etm4x: drop owner assignment
        (no commit info)
[06/19] coresight: funnel: drop owner assignment
        (no commit info)
[07/19] coresight: replicator: drop owner assignment
        (no commit info)
[08/19] coresight: etb10: drop owner assignment
        (no commit info)
[09/19] coresight: stm: drop owner assignment
        (no commit info)
[10/19] coresight: tmc: drop owner assignment
        (no commit info)
[11/19] coresight: tpda: drop owner assignment
        (no commit info)
[12/19] coresight: tpdm: drop owner assignment
        (no commit info)
[13/19] coresight: tpiu: drop owner assignment
        (no commit info)
[14/19] i2c: nomadik: drop owner assignment
        (no commit info)
[15/19] hwrng: nomadik: drop owner assignment
        (no commit info)
[16/19] dmaengine: pl330: drop owner assignment
        (no commit info)
[17/19] Input: ambakmi - drop owner assignment
        (no commit info)
[18/19] memory: pl353-smc: drop owner assignment
        (no commit info)
[19/19] vfio: amba: drop owner assignment
        (no commit info)

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
