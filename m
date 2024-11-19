Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F769D2CD2
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Nov 2024 18:42:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8981DC6DD66;
	Tue, 19 Nov 2024 17:42:07 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 322BEC6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2024 17:42:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8FD96A42D80;
 Tue, 19 Nov 2024 17:40:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83357C4CED0;
 Tue, 19 Nov 2024 17:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732038118;
 bh=fC4Iu6ZTvWHVn0mAs02BF67Zmknk558M9DVYXjCgc4A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ss2liA1CbtHjZtbxReG294xHb1gK7mWNfZcPAT3S6IoLVxeHOZMI+N76tfRN18dpw
 L0tCD/2wgFXBxM1qWJDBHnZDl/jeJfSvEHTX64KLSF1Eqd1AT5HZnLaeeEifiYC+XE
 lzfgTvx/U3s/CbkjsUN/v/hPdBPOhRs0AnlvtVG0F7ff9y+iQ7JyaMYz5BzwDNwaqL
 Y6jZEput4/yxkde6XPdP7J7qVCn3OVSJuYQ8YpwqS3PL3KAOPep8m8CF2eRqxyswUn
 9TkeeWfUkuZBtlY/nZGfs6xrY9pj0jxfGmYU/5GRXFRCYHDkZzQmhcg24iyx4m/WQX
 y+yEn6R3bYzJw==
Date: Tue, 19 Nov 2024 11:41:56 -0600
From: Rob Herring <robh@kernel.org>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Message-ID: <20241119174156.GA1862978-robh@kernel.org>
References: <20241118-schema-v1-0-11b7c1583c0c@quicinc.com>
 <20241118-schema-v1-1-11b7c1583c0c@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241118-schema-v1-1-11b7c1583c0c@quicinc.com>
Cc: quic_jsuraj@quicinc.com, quic_tengfan@quicinc.com,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 quic_tingweiz@quicinc.com, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, quic_jiegan@quicinc.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, linux-arm-msm@vger.kernel.org,
 quic_jingyw@quicinc.com, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, quic_aiquny@quicinc.com
Subject: Re: [Linux-stm32] [PATCH 1/3] dt-bindings: net: qcom,
 ethqos: revise description for qcs615
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

On Mon, Nov 18, 2024 at 02:16:50PM +0800, Yijie Yang wrote:
> The core version of EMAC on qcs615 has minor differences compared to that
> on sm8150. During the bring-up routine, the loopback bit needs to be set,
> and the Power-On Reset (POR) status of the registers isn't entirely
> consistent with sm8150 either.
> Therefore, it should be treated as a separate entity rather than a
> fallback option.

'revise description' is not very specific. 'Drop fallback compatible for 
qcom,qcs615-ethqos' would be better.

However, this is an ABI change. You could leave the binding/dts alone 
and only change the kernel driver to match on qcom,qcs615-ethqos to 
achieve what you need. If there's a reason why the ABI change is okay, 
then you need to detail that. Did the driver never work? Are there no 
users yet?

> 
> Fixes: 32535b9410b8 ("dt-bindings: net: qcom,ethqos: add description for qcs615")
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ---
>  Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> index 0bcd593a7bd093d4475908d82585c36dd6b3a284..576a52742ff45d4984388bbc0fcc91fa91bab677 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> @@ -23,12 +23,9 @@ properties:
>            - enum:
>                - qcom,qcs8300-ethqos
>            - const: qcom,sa8775p-ethqos
> -      - items:
> -          - enum:
> -              - qcom,qcs615-ethqos
> -          - const: qcom,sm8150-ethqos
>        - enum:
>            - qcom,qcs404-ethqos
> +          - qcom,qcs615-ethqos
>            - qcom,sa8775p-ethqos
>            - qcom,sc8280xp-ethqos
>            - qcom,sm8150-ethqos
> 
> -- 
> 2.34.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
