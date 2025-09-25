Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3890FB9F549
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Sep 2025 14:47:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DEB78C3F952;
	Thu, 25 Sep 2025 12:47:24 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2DB94C36B2D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 12:47:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 199EB60556;
 Thu, 25 Sep 2025 12:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26E82C4CEF0;
 Thu, 25 Sep 2025 12:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758804441;
 bh=0va9/EyMjKMurKnEoNlMlsGNtwpMnvTh5eZELuACqr4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uB2kh8MekoL4HrWbZoaCpxvMyS1CQqAccAKQLSC7vRrWXOMJHeDiNACXwxOwivuTW
 k3PdEOhRVEhcJddTgo0imo10Qrbgx92Ya+Qwv+W5FVLML7ADPkvFA02EylFVCuWB5n
 mTPYIbssgGiVYtsmdxhUXe7BjENkH+JfAh6lwk5hGAU0P7m3KPH7D5phcZ/WLfKVuw
 DwTQ8+Qrvnbt6p15pI3dJygeAvm8Ec8NqUrCIMyIVDS8umoAbGf33wrqBXZeLvYD2+
 auia77sI9GhXZzMfG9BA1xVLeyxjNLUKnpE8jFXFSXczpx5uMpOhtaRcOitj40Yu29
 64XJzoeE/aNWw==
Message-ID: <9d1bc76e-9070-459b-bb83-92aed2fc8e0c@kernel.org>
Date: Thu, 25 Sep 2025 13:47:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Taniya Das <taniya.das@oss.qualcomm.com>,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-2-d7ea96b4784a@oss.qualcomm.com>
 <a8ebec72-eee2-4a02-ac6b-57678aa7c50f@kernel.org>
 <P5tG63fZnyrHYqzybjhoOpgXBlJQHT92Z3VjYNKDSMpfjuZsHZ1_QlpibvJLNKH5mvMsoZeFGDqCKJJb6gpvcg==@protonmail.internalid>
 <1c90a127-4b39-4cad-9805-d4449990baa7@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <1c90a127-4b39-4cad-9805-d4449990baa7@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 tingwei.zhang@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 trilok.soni@oss.qualcomm.com
Subject: Re: [Linux-stm32] [PATCH 2/9] dt-bindings: clock: sm8450-camcc:
 Remove sc8280xp camcc to from sm8450 camcc
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 25/09/2025 09:44, Taniya Das wrote:
>> This is not a revert.
>>
>> Where does the compat string go ?
>>
> The compat is now part of
> Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml as part
> of this commit "842fa7482915".
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
