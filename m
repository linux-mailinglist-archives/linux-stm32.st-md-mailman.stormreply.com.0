Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B32A6C2AAB
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Mar 2023 07:47:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33C61C6A603;
	Tue, 21 Mar 2023 06:47:31 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 033A1C6A5F6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Mar 2023 06:47:30 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id w9so55753248edc.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 23:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679381249;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vud8OdanTIVE8CKcTMVQ4gPfhnpd++tLAO321wwmVqE=;
 b=WU4xX6kjc3o/CIHowPEa/CpBbEe85Iy5kyudkFpNiMq8oQuLVFC0LR45eT7xOc1nPn
 B+CPR33JLOvMNdVhWOaAqIBhWBs6eY9zkPEwPKYJDaNnfiaskWZAzwagHGG55FUuWdfk
 LLq4YteSf4JjlnoFe2v3Q4DxhOqnmlUM+sJzI6xp0FoIsld4WOCuhQrLucf4o/W1gUfQ
 QUX/RuxPad5JQzpuT0JHaT/Y1qhiGNQOqiZ44ivhz2fI+8byWRgZRA35vqHeOWQHnE9r
 Por4lmFx6lu6DhXzZCMkhvxHhCN6KhHYida25CxBS8IUeAv7WjbxOo7seBcmFsV9T1PI
 RrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679381249;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vud8OdanTIVE8CKcTMVQ4gPfhnpd++tLAO321wwmVqE=;
 b=XUoEhM+7S4ulJhL5ihLPRawR5Ae9+f8WE3atbtk+E44VT/KOpTDTrl391uzdI/bmSy
 a6sGEo4/ZSGiziLRc2NZNp6v0G6z/Pzax9xc72nHYKDcAc2o0/YLrq7jD1FmzwvV1rr9
 hrd1nGgAIs6paoZ/fMgsFegeYZuMiKbF7e2oj9rg0LgzpPbnd9Th4zIv25QMXibkO8Hp
 3qoaAHrmms6rOVeEU1Fk9pyu4KBzKE8wGMyvAHYdBYbQalSkfEAGKfkFeJDaUf4Ydw/5
 fscrZjr0+O9Jhuaz6h+XnFq2L+Uby+CHLFVwW21BqOAzZyaWLu/45ScZzUYdg06QI/0t
 QDMg==
X-Gm-Message-State: AO0yUKV0rn0KWPJDQ4bdk4ONUSPbetoc8/6CV3ylkugLeUWiBOcgtpMc
 jR2bHrq72xlVHW5se1bCvSELow==
X-Google-Smtp-Source: AK7set/mHtnHjY2cm9ymS5lUjnyMD7P05cMdzN8twXG3Yom40qNsZwuqvW6/nCj/jJdo9I6WMLGfsw==
X-Received: by 2002:a17:906:848e:b0:931:88e8:d470 with SMTP id
 m14-20020a170906848e00b0093188e8d470mr1907064ejx.23.1679381249526; 
 Mon, 20 Mar 2023 23:47:29 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:2142:d8da:5ae4:d817?
 ([2a02:810d:15c0:828:2142:d8da:5ae4:d817])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a1709063f8700b008eddbd46d7esm5375770ejj.31.2023.03.20.23.47.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 23:47:29 -0700 (PDT)
Message-ID: <88368e85-3d1b-63b2-1f31-3a41df1632c9@linaro.org>
Date: Tue, 21 Mar 2023 07:47:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Andrew Halaney <ahalaney@redhat.com>, linux-kernel@vger.kernel.org
References: <20230320221617.236323-1-ahalaney@redhat.com>
 <20230320221617.236323-4-ahalaney@redhat.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230320221617.236323-4-ahalaney@redhat.com>
Cc: mturquette@baylibre.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-clk@vger.kernel.org, tee.min.tan@linux.intel.com, linux@armlinux.org.uk,
 veekhee@apple.com, hisunil@quicinc.com, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, andrey.konovalov@linaro.org, ncai@quicinc.com,
 devicetree@vger.kernel.org, bhupesh.sharma@linaro.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com, bmasney@redhat.com,
 mohammad.athari.ismail@intel.com, robh+dt@kernel.org, ruppala@nvidia.com,
 jsuraj@qti.qualcomm.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, sboyd@kernel.org, netdev@vger.kernel.org,
 andersson@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 agross@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
 echanude@redhat.com, mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v2 03/12] dt-bindings: net: qcom,
 ethqos: Convert bindings to yaml
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

On 20/03/2023 23:16, Andrew Halaney wrote:
> From: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> 
> Convert Qualcomm ETHQOS Ethernet devicetree binding to YAML.
> In doing so add a new property for iommus since newer platforms support
> using one, and without such make dtbs_check fails on them.
> 
> While at it, also update the MAINTAINERS file to point to the yaml
> version of the bindings.
> 
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> [halaney: Remove duplicated properties, add MAINTAINERS and iommus]
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> ---
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
