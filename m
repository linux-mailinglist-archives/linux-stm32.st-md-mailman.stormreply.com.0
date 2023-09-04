Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBF1791270
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Sep 2023 09:41:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C19AAC6B47E;
	Mon,  4 Sep 2023 07:41:40 +0000 (UTC)
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B15B9C6B44C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Sep 2023 05:43:19 +0000 (UTC)
X-QQ-mid: bizesmtp69t1693806064t61ncw53
Received: from wangjiexun-virtual-machine.loca ( [120.225.34.249])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 04 Sep 2023 13:41:02 +0800 (CST)
X-QQ-SSF: 01200000000000001000000A0000000
X-QQ-FEAT: rZJGTgY0+YOS3vKl0NMirRR1pAhmed70/gLFuj/Gr660BtUWLKoHQ7PnNRXSp
 X4pSLbZOdfAkBI4khh9tRvTDbOaTQlmcKegcyzoPBsaxHw25F18pQGBZDtYpE5OJ3kdPkqE
 zwijwvHa/JIzv4ytcLinIVlEorFNeSv09106k4IKEpljgzyNnhgo+tah2zJJLYl1k8XWr4+
 eOKAT4b8ezpPcdUycki4Vdq+okzxerMB29oA6vgy7xa29tA7V8mwxuxL8Y5LtlGjkwYIyH6
 UYM2lN8Xy7WdmPIEXzR+HvsbvAOP+0YgUBM8CSyYsM4HgldighDFRgGbHJ6uj0goaRS1z8o
 L2CcmKGSJ7jAzVqa4fUbg/AWACFeCZJeUqWmjDi
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4421248991332191876
From: Jiexun Wang <wangjiexun@tinylab.org>
To: jszhang@kernel.org
Date: Mon,  4 Sep 2023 13:41:00 +0800
Message-Id: <20230904054100.142575-1-wangjiexun@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230827091710.1483-1-jszhang@kernel.org>
References: <20230827091710.1483-1-jszhang@kernel.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-0
X-Mailman-Approved-At: Mon, 04 Sep 2023 07:41:38 +0000
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, robh+dt@kernel.org,
 linux-kernel@vger.kernel.org, edumazet@google.com, joabreu@synopsys.com,
 krzysztof.kozlowski+dt@linaro.org, peppe.cavallaro@st.com,
 simon.horman@corigine.com, kuba@kernel.org, linux-riscv@lists.infradead.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/3] add the dwmac driver for
	T-HEAD TH1520 SoC
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

On Sun, Aug 27, 2023 at 05:17:09PM +0800, Jisheng Zhang wrote:
>Add the dwmac driver support for T-HEAD TH1520 SoC.
>
>Since the clk part isn't mainlined, so SoC dts(i) changes are not
>included in this series. However, it can be tested by using fixed-clock.
>
>Since v1:
>  - rebase on the lastest net-next
>  - collect Reviewed-by tag
>  - address Krzysztof's comment of the dt binding
>  - fix "div is not initialised" issue pointed out by Simon
>
>Jisheng Zhang (3):
>  dt-bindings: net: snps,dwmac: allow dwmac-3.70a to set pbl properties
>  dt-bindings: net: add T-HEAD dwmac support
>  net: stmmac: add glue layer for T-HEAD TH1520 SoC
>
> .../devicetree/bindings/net/snps,dwmac.yaml   |   2 +
> .../devicetree/bindings/net/thead,dwmac.yaml  |  77 +++++
> drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
> drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
> .../net/ethernet/stmicro/stmmac/dwmac-thead.c | 302 ++++++++++++++++++
> 5 files changed, 393 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/net/thead,dwmac.yaml

I would like to try this patch on my LicheePi 4A board, 
but I don't know how to modify the dts file.
Could you please share your modifications to the dts file?
Thank you very much.

Best regards,
Jiexun Wang
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
