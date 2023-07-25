Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A8F7623BB
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jul 2023 22:42:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05DD9C6A61A;
	Tue, 25 Jul 2023 20:42:29 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7F4BC6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jul 2023 20:42:27 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-992dcae74e0so970155366b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jul 2023 13:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690317747; x=1690922547;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=luoqn8Oevn7bkqgAb6fNJnOH+RZZKqe9njAp7OGyFq0=;
 b=TbDvrQE8gms3+U4G88aHi+ZQECy/VuP63cWu8W2dq0cyAMuW4okMl6e5H6YZGvHdFA
 09cT8OdwzanTzAVTAKSYmHtIwNNfGdE/62luw5mHiryktLTpk+PT2BNNvVqFAwyFYGZN
 sBrDQo0YMB61Ao/F3pwRV3nbm8415wyzaR8PxhuSqpANptSdsoxE5QwbaoaEupbkWsHL
 y73d/08ukkJUV5YJdnkCfbpstBWhOXPQjiateZyzmIzqqZ0kLAooo216anwXs3I+gpVe
 bWA2wSUbx23qnpu63RAUdMVJpNwyMQJRkmBrBvkTB1IOSjHX8KdaBgGLGOwdK0HstgAZ
 8nbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690317747; x=1690922547;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=luoqn8Oevn7bkqgAb6fNJnOH+RZZKqe9njAp7OGyFq0=;
 b=iqsQrI9++pzAO5Wf3/ijerdp7U8s43Jx6hmluIsTXqq2TYvxiF/N+bLKGcVFJ7aPn0
 rGeookVm2nUi9eNgwttPhj/AYBZmm4R+2/LIEi/VbW+Pwcx/LEeW2JDzGMeE+gVIxsb/
 PUGkeZpKHOfa1MmIZbiccSO0+Rl2aTHKM2OYZXU2ajVKYPe88bZsVyfViSdnn3NAGQfZ
 ZUIRehVYQmKh0pjdA6bVACrymt7/juSoT4PlQqD6WYqBiuvdnBf6yo4kPL+dittP7Dr+
 stNiPvQiMe1Xx+wySDqPNkWoX3xJU2glziUe7hPWp6T2lcAqQ64gkTxlzH38/5csfCLt
 +tyg==
X-Gm-Message-State: ABy/qLbtanC7XasxIeP1GbgwV6V+4TBLii5BsclrdpcGJt0ehu5ZYnXd
 urHexNhb5p7a97UZqRY3oCMRmA==
X-Google-Smtp-Source: APBJJlEN+nPjs/HeMvPv2U7XvIehtqxdjyI+/5qdTTdyp4g8mGDSFv84MiTD2ay4Fs+0aghWfmNRYw==
X-Received: by 2002:a17:906:224c:b0:993:e752:1a70 with SMTP id
 12-20020a170906224c00b00993e7521a70mr14758414ejr.19.1690317747226; 
 Tue, 25 Jul 2023 13:42:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 rv14-20020a17090710ce00b0099b921de301sm3930223ejb.159.2023.07.25.13.42.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jul 2023 13:42:26 -0700 (PDT)
Message-ID: <aa2c2681-1593-2e5e-0131-2f916fbdd14a@linaro.org>
Date: Tue, 25 Jul 2023 22:42:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20230725105421.99160-1-krzysztof.kozlowski@linaro.org>
 <246eea6e-dd34-426f-9fc7-427d808fe8f0@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <246eea6e-dd34-426f-9fc7-427d808fe8f0@sirena.org.uk>
Cc: linux-arm-msm@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Saravanan Sekar <sravanhome@gmail.com>,
 devicetree@vger.kernel.org, Pascal Paillet <p.paillet@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 ChiYuan Huang <cy_huang@richtek.com>, Andy Gross <agross@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 - <patches@opensource.cirrus.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Robin Gong <yibin.gong@nxp.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/2] regulator: dt-bindings: add missing
 unevaluatedProperties for each regulator
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

On 25/07/2023 13:14, Mark Brown wrote:
> On Tue, Jul 25, 2023 at 12:54:20PM +0200, Krzysztof Kozlowski wrote:
>> Each regulator node, which references common regulator.yaml schema,
>> should disallow additional or unevaluated properties.  Otherwise
>> mistakes in properties will go unnoticed.
> 
> This doesn't apply against current code, please check and resend.
> 
>>  Documentation/devicetree/bindings/regulator/ti,tps65090.yaml  | 1 +
> 
> This doesn't seem to be upstream.

Indeed, I should exclude any work-in-progress. Apologies. I'll fix and
send v2 of this patch.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
