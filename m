Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9DF968809
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Sep 2024 14:56:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CCC5C71292;
	Mon,  2 Sep 2024 12:56:04 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9947FC6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Sep 2024 12:55:57 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5c263118780so536989a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Sep 2024 05:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725281757; x=1725886557;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mRq1nfnnUhUMRuP7ndrQm92a5ybx/cYKL+FVE11lKTg=;
 b=adIpZQ+OTXnBpKBVsKlJlizsKy3OZ8SDtNb5O99DrfFkPinj8Qo8soypLp9czRaDD7
 KD9WBLKyGQE5vu+yp6aOQaqKjXzTZdLhtLyngl5aJRYJ1E8bYfDIsozt0Rzus2+rcSVE
 CCfsqyo1LqMgHZK3OMmNWzOKitEUO4iWrH4tzkWz/Z4Ato3a4kVbaI6907ELyO8X+5CP
 XODDiGxrgGbEVHWypYWeG84Qy3s/mFUfzLOy/bz9Kv1ioPN9mMH+NY0jLd7rJfTx26+z
 sS2ee/w4/XEauWj2v5zZdJbBMUi7vgbxh+4p44yBNFgiT/s7V/5MpiFxoAz+C/NKdw0/
 Qyaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725281757; x=1725886557;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mRq1nfnnUhUMRuP7ndrQm92a5ybx/cYKL+FVE11lKTg=;
 b=YgWxcfmmPAv+5Co8ogRVFODnBk6T4c+IWpY4y0lkZh+Eefa4rljnPtqQJ1npGSDL/z
 IkBfFLGahy3VGo+sK/vwo/xCuHQnQxRxV15SyVDNk7g3yo0l0MJ5isJoKQSiZO24ClGc
 ZUBvEMWN1A/Im3hkToVsl6KcNLdBc2C4Ceqaqcgna0T29mKHbq4ucK7rgH3bgz/hsRxr
 X+rOm9+cg4NWFB4caGh7qelXe8VUyo4KwxpFNskLbcos5QnxWuMHuiuAC/CB08NK0v3J
 tq5jKMDo8Nt6GcVauA2AbCNp70zvKCOvS5QmHA0SlG7QrtYZNSe0tWFSTnWNgkZZuc6B
 xd2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnQCOwsQJxFFSAWCUiLKq27eY/yP5FuIt8UU7SenxI7xTdly+dL88DFZKCAQxwAEd4mDY51QYQ46niuA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwtA63cEet4+zKFhUxOMMDDxo6/SivMMjbGUIh+4vU8lElQQQ6h
 E1a2GJAfO2DknrGevSUk9+aqnoFZbfBd3Kb/yTFqmUPtY+h7KLKsXT6k49zHPoo=
X-Google-Smtp-Source: AGHT+IEoQ4/Dfc500DOxwirAQ3QPvKcm4UqzswYSK6n4xJfPLS8U3/M0gXvKw2QuMJYLiGjD5OQvnA==
X-Received: by 2002:a17:907:944c:b0:a89:d1cd:1936 with SMTP id
 a640c23a62f3a-a8a1d29ba5emr10139966b.3.1725281756767; 
 Mon, 02 Sep 2024 05:55:56 -0700 (PDT)
Received: from [192.168.68.116] ([5.133.47.210])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988feb410sm558203166b.21.2024.09.02.05.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 05:55:56 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240811151737.106194-1-krzysztof.kozlowski@linaro.org>
References: <20240811151737.106194-1-krzysztof.kozlowski@linaro.org>
Message-Id: <172528175582.63217.5487746839450506262.b4-ty@linaro.org>
Date: Mon, 02 Sep 2024 13:55:55 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.2
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: nvmem: st,
 stm32-romem: add missing "unevaluatedProperties" on child nodes
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


On Sun, 11 Aug 2024 17:17:37 +0200, Krzysztof Kozlowski wrote:
> All nodes need an explicit additionalProperties or unevaluatedProperties
> unless a $ref has one that's false.  Fixing this for STM32
> Factory-programmed data binding needs referencing fixed layout schema
> for children.  Add reference to the NVMEM deprecated cells for the
> schema to be complete.
> 
> This fixes dt_binding_check warning:
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: nvmem: st,stm32-romem: add missing "unevaluatedProperties" on child nodes
      commit: 0d1d52a2d43b56d6bd33328583c81d85c1aa97f6

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
