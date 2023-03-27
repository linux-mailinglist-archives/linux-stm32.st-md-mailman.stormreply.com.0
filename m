Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBEA6CA9F8
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Mar 2023 18:07:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DEE8EC6A5F2;
	Mon, 27 Mar 2023 16:07:11 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71B04C65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Mar 2023 16:07:10 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id er18so27096282edb.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Mar 2023 09:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679933230;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8LEsDycoDNNxiuweLLNkVCjBLy1OwMwyxbYDv9vom5U=;
 b=pPbTxNH0ymm/YMKamoshQU8TY9g5bLT38o6aex+MqUWlO56U2WBGW4kKRxU5toxzQW
 fLq9wljTRSgdD/SNk3umxElyHAtWjagWir3tguwLug8WDmM4FujxETm7B7kPz13YAONo
 EkOOmftrFozf8j9K+8AAqWP90HyOXkLQd2m+mUS3wZOnRi6H/dZtUkwaDcPHpfEQ62i+
 IwiXyp+3sH/vUdyazYe6+UIKeg8uR+t3o7NAFbp5+nMBRRthYMe0jMKjiQAKLcspHcNm
 RjSsDUjcDUgIjDIHq+FTspeyk6BDjYZ4BhEb8LWUlwgHp0qm69zsZxi0eOJq4fvMiqLE
 07jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679933230;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8LEsDycoDNNxiuweLLNkVCjBLy1OwMwyxbYDv9vom5U=;
 b=czvvskEP9USgG+1iIaR5nhCHMmR/B5Y7c62BuCXnewEqCSYS7FALgfrMJwMstqtEOw
 bLIeP3YCdCmVzsMbOCegVWlxEtjLwLqfiexZ1Pn6Z43tCtXfjY243EPcGmDNK5OMwsNA
 sSxr3XnHtYg6y/av+0xxOs4Om55i0qaPh6S2gET0ftaU6GWn/Igb+kbEgCRemhkUyI+a
 /q8Jax79yQe5O7LSGOdXfTDGCT+MXOJVrvofLPzdFxi9gjjg3m059XdEONfMciUvaHu/
 Ei5Rme2WJIdS5Bycvq6XFoCYCXI/U0YyEhfs9ZXEoJIUenlIaL1YMImKCSFMuMxTyNvr
 X8kw==
X-Gm-Message-State: AAQBX9eHdAP7okdkHNf/toP58+ASC3BG4jt8eIiAZXNPcgRpdxv7FL+u
 0MCTrVs72NMz1lc/fJTzy28ayA==
X-Google-Smtp-Source: AKy350bG1gjpcfly7fVco4g5TTDffVoqBAJyfj3y0NuqH7ZswKxBS8s8PhmNNfNfw9CvFBV4It9Dbg==
X-Received: by 2002:a17:906:a8d:b0:878:52cd:9006 with SMTP id
 y13-20020a1709060a8d00b0087852cd9006mr13713393ejf.69.1679933229936; 
 Mon, 27 Mar 2023 09:07:09 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:581e:789c:7616:5ee])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a17090607d100b0093a768b3dddsm8787820ejc.216.2023.03.27.09.07.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 09:07:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 Christophe Kerello <christophe.kerello@foss.st.com>
Date: Mon, 27 Mar 2023 18:07:06 +0200
Message-Id: <167993322006.178792.4595537654296937780.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230324155105.826063-2-christophe.kerello@foss.st.com>
References: <20230324155105.826063-1-christophe.kerello@foss.st.com>
 <20230324155105.826063-2-christophe.kerello@foss.st.com>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] (subset) [PATCH 1/2] memory: stm32-fmc2-ebi:
	depends on ARCH_STM32 instead of MACH_STM32MP157
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

On Fri, 24 Mar 2023 16:51:04 +0100, Christophe Kerello wrote:
> To be able to compile the driver on all STM32MP SOCs, we move the
> "depends on" on ARCH_STM32.
> 
> 

Applied, thanks!

[1/2] memory: stm32-fmc2-ebi: depends on ARCH_STM32 instead of MACH_STM32MP157
      https://git.kernel.org/krzk/linux-mem-ctrl/c/20c082a2ba25374a13505b78cdad7f6a2cf8d763

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
