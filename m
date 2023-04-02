Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 902566D3767
	for <lists+linux-stm32@lfdr.de>; Sun,  2 Apr 2023 12:49:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45749C65E56;
	Sun,  2 Apr 2023 10:49:44 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1C61C0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Apr 2023 10:49:42 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id ek18so106603277edb.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 02 Apr 2023 03:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680432582;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hjR00TgAnnMwLDCvz0xT0MzHATrmHlJrCAFtw5aFKdk=;
 b=pkSrbHT2FYuk1Z6tCCsWbzsSFqJrBPI6wjADRsIIxnUglOL3L9Qu6voguaiIUrnnU2
 JPjcWYsxgRQbir6z1Wx/eDztWZiSw5OBWG4HtkXAkEsR3exMnhz0XP47cDxIk6Dl7vDa
 f3vCSRhXip5T1S8AQVDzFKP6Cd31AO9Ihs6Sy4B1AeWwcE0FX2PpeYJxULMlok4JVIPp
 ydNNsv8E8ral5yWhU2/zxN5VSC6lRhnlGefjW3J8G1lAF3F1c4YYF0/9Xlyl0isNvVjf
 m8ucRuuoWEMiGSBM5/+sHQuME5Lqt7GIZKs0VmolQsb3CzO+35GIp315QJlpRNegKbnL
 Lzig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680432582;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hjR00TgAnnMwLDCvz0xT0MzHATrmHlJrCAFtw5aFKdk=;
 b=5vDu4E1izf2Gs7VG6yFZzLrRAorzdmsNMMLCNVprVJkRU+iwEUEfMG4Lw+eaF0Ghoz
 43nU4xvWC7kvfWSEElDP+YtVs6Abh2VuFsONFaYlR5oMJsLox89s09kzRNNSTB3mBPg4
 K8ieQXBAk3giI/a5lHPAO9czdWibes/gGh8aZpHbUZbsLSGd+aiurpYJ2NZ6kvy5MjVE
 5p79sckjXQzYXr3cIO8su6TrbHmMiU0OJJmJF+MV8Z/LsBLXrtJ1k9oyR3YwdTwPt3VY
 0BRT9l4krv6bJajcqWD3dxIxTG47KRXdzuRWZfKNamFWEj2oXkq1P9GEGaq/diBBjjOV
 JKJQ==
X-Gm-Message-State: AAQBX9chM1zOZXhOpGEHvzxcniC88G/Ex5nV50UukJAqEWPo8K479XXi
 NQcvKDbV7Sqroc4u8gaTwsm1cg==
X-Google-Smtp-Source: AKy350bwisRgcgGnMtchBJUcbuj4Pcg+osZs9dbE8qToLV5KDtYpFRlg5/KXsZxdQi+Q/OWZDnLNPA==
X-Received: by 2002:a17:907:a42a:b0:947:d757:d822 with SMTP id
 sg42-20020a170907a42a00b00947d757d822mr6531312ejc.68.1680432582447; 
 Sun, 02 Apr 2023 03:49:42 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7f7f:6a30:7a20:94d5?
 ([2a02:810d:15c0:828:7f7f:6a30:7a20:94d5])
 by smtp.gmail.com with ESMTPSA id
 ee55-20020a056402293700b004aef147add6sm3082265edb.47.2023.04.02.03.49.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Apr 2023 03:49:42 -0700 (PDT)
Message-ID: <a13ae120-b50c-b5ef-a686-bc811e6b9d37@linaro.org>
Date: Sun, 2 Apr 2023 12:49:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Andrew Halaney <ahalaney@redhat.com>, linux-kernel@vger.kernel.org
References: <20230331214549.756660-1-ahalaney@redhat.com>
 <20230331214549.756660-5-ahalaney@redhat.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331214549.756660-5-ahalaney@redhat.com>
Cc: mturquette@baylibre.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-stm32@st-md-mailman.stormreply.com, tee.min.tan@linux.intel.com,
 samuel@sholland.org, linux@armlinux.org.uk, jernej.skrabec@gmail.com,
 veekhee@apple.com, wens@csie.org, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, andrey.konovalov@linaro.org, ncai@quicinc.com,
 devicetree@vger.kernel.org, bhupesh.sharma@linaro.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com, bmasney@redhat.com,
 mohammad.athari.ismail@intel.com, robh+dt@kernel.org, ruppala@nvidia.com,
 jsuraj@qti.qualcomm.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, echanude@redhat.com,
 konrad.dybcio@linaro.org, vkoul@kernel.org, hisunil@quicinc.com,
 mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v3 04/12] dt-bindings: net: qcom,
 ethqos: Add Qualcomm sc8280xp compatibles
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

On 31/03/2023 23:45, Andrew Halaney wrote:
> The sc8280xp has a new version of the ETHQOS hardware in it, EMAC v3.
> Add a compatible for this.
> 
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
