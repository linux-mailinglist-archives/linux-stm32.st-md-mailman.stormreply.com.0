Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B676699A8B9
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Oct 2024 18:18:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67459C78020;
	Fri, 11 Oct 2024 16:18:51 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74221C7801E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2024 16:18:46 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 45A6789380;
 Fri, 11 Oct 2024 18:18:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1728663526;
 bh=7OnMDRBBif/ifvRdujrBF2mJgQF6N6AT/gVMCXwQu30=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gQqcnntDv8SZ0MTLiKmxBawB44JNAjL8RVEWWLFgLQUzpojBtVeLQi9K7x/xP045H
 mz5WT4xJOzqpLcIoYvmXVCN7lzqmah0+rqR60X+/JFen+Ei9jQLPUge1e08TBZQVqO
 +DEngWSmGiH0ZITBphyZs6EbHNejX0GQXq/OHIkeugm3+9243fX+1sQyzL4TV12YAu
 iLoMKtg2U1Jltj8mKAUHTQKwJktd4h5KpxNEdoBN/BJ+Dk+1Mly5El5YzlIrQUIHgl
 EwOlzviJNtuO8Mkqen3yVqrICHkfwfMSJWievwg0IQaGfaT76ojWyUdOFs4kn+nT2Q
 8BFrsg5qP4lDQ==
Message-ID: <9c957e5f-91a2-4ff8-8f17-3d79af56949c@denx.de>
Date: Fri, 11 Oct 2024 18:17:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>
References: <20241011-rng-mp25-v2-v2-0-76fd6170280c@foss.st.com>
 <20241011-rng-mp25-v2-v2-4-76fd6170280c@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241011-rng-mp25-v2-v2-4-76fd6170280c@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 4/4] arm64: dts: st: add RNG node on
	stm32mp251
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

On 10/11/24 5:41 PM, Gatien Chevallier wrote:
> Update the device-tree stm32mp251.dtsi by adding the Random Number
> Generator(RNG) node.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Reviewed-by: Marek Vasut <marex@denx.de>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
