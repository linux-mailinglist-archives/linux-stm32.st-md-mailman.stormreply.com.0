Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2346B644842
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Dec 2022 16:45:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B704DC65E6C;
	Tue,  6 Dec 2022 15:45:09 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5A2DC65E5D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Dec 2022 15:45:08 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id p8so24283982lfu.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Dec 2022 07:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lNf0oPz1+3JYITF+uARI5oqprCns7og7GMeWkwgQOfc=;
 b=Kx8saFYoHs97DPlt7rrWo2mlAeMwmhdrZXHcU6ApGZvCEcPzi+fsL29ZykBAdUog/p
 4RhjCcy+vvcGMq5PQyQA7TSNYry9E+K3FGHTw8SpdUT4WGFAOtEqVhtysayPFRJlxqOs
 dPbdVzjGH4w7YTBIKP69tRClDuUpWxwP60LHj5r3/rtPtf31XDHArnKPYS4DhO00wKRn
 +7e5S05nSpyz6sFoVtz9C7uRJj0P8kFprLbiwFBfFO/INtdatDSMEBGkPsmco4XMgMtN
 x+QVEirO8ZUBFE4h1OAclT2O5ukRBq1bzdNO5EQ3j1uDU63bACCnKe6NYtqG9+khx8Ld
 xIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lNf0oPz1+3JYITF+uARI5oqprCns7og7GMeWkwgQOfc=;
 b=G6AndQC1ejPoo24zewGxIZ1C5l8O6BCamy9ClIjn550HQA6xPBde6MTrSXCbfXv8Yg
 C3KIc0fUbnghOhNohnEIKAqHgdC0vu8eMwKOThsR0g9ag6lsawkPVGbMS8VSFA+xopJO
 gBYjCscOQbJc9nVPqsG7B+5rG1xnufUGziTwJv+5BPWr8pEq5GFhscuZQXJYTPJwG2YM
 wlu9i0Admmadsc+5GOhBjU0mVJyOX+wobrRkMmxPJl4fHyXiPNTp82A8HbRB0WwE9im3
 f8uWuZvJI8XvgtCi87nRzilMM6RA+gxHrGP4LXk/tw1E+w2KYt7Ttsykwgs8MByE7dUT
 A1yw==
X-Gm-Message-State: ANoB5pnvoBgDxZ52kmlfEyfTshEBbLaNmaOFuQl5cA7mt43ALnLqrDXa
 rppaRGz4Hur7vSWKqyWLRLcGUg==
X-Google-Smtp-Source: AA0mqf5Jh+Dt9wCImCiy9pkyTRtPnrr1eJHFTxSsl5fLdur/tl5B+TujlU7R0CiZRMeh4aFTfnhVGA==
X-Received: by 2002:ac2:4e0a:0:b0:4a2:2aab:5460 with SMTP id
 e10-20020ac24e0a000000b004a22aab5460mr22854399lfr.62.1670341507919; 
 Tue, 06 Dec 2022 07:45:07 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 v5-20020ac258e5000000b00492ea54beeasm2518454lfo.306.2022.12.06.07.45.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 07:45:07 -0800 (PST)
Message-ID: <d17bef48-0804-3ccc-a14e-9043ae615573@linaro.org>
Date: Tue, 6 Dec 2022 16:45:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: "nathan.lu" <nathan.lu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20221206020046.11333-1-nathan.lu@mediatek.com>
 <20221206020046.11333-3-nathan.lu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221206020046.11333-3-nathan.lu@mediatek.com>
Cc: devicetree@vger.kernel.org, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 linux-mediatek@lists.infradead.org, CK Hu <ck.hu@mediatek.com>,
 lancelot.wu@mediatek.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH v4 2/6] dt-bindings: mediatek: modify
 VDOSYS0 mmsys device tree Documentations for MT8188
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

On 06/12/2022 03:00, nathan.lu wrote:
> From: Nathan Lu <nathan.lu@mediatek.com>
> 
> modify VDOSYS0 mmsys device tree Documentations for MT8188.
> 
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
