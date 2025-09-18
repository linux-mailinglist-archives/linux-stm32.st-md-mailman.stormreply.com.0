Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11325B84250
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Sep 2025 12:39:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25F61C3089F;
	Thu, 18 Sep 2025 10:39:42 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F1A0C3089D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Sep 2025 10:39:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B0D77439E7;
 Thu, 18 Sep 2025 10:39:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69582C4CEEB;
 Thu, 18 Sep 2025 10:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758191979;
 bh=fgVQ+j91Fez+nkL73mza5lRSVa/JXo8LJ4pD2kGgnIo=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=j3+FK3JAwgdtXmAmA/n8u92H71M5nmXhj88js81lHZ0PXcz6dejE4g+PoS1D2NCaN
 eQnTteMfrViMm+HcaWZrAEgPLB2ij3iBbzpI0Y1V5RKXEUhzETS+SxXn7XLZXIXmki
 PvAil22+9Tolh89AXqSomKl9WjJuKKeJ7AQsqfjJV+V5Vqq5+9Nlnl8HvmH+h5+3Ae
 frBfUxrXUWKG7IthYpVWfT/AT4I1+wsRXPrnMtBTa3g3wHhofsApylkI9b02aZSkgj
 71CUivatKdvvr1C6gvAtstsxtB8hy8r94dET5moVfTum20xjdekXQmHOUCmNZTRIie
 FePqtINQC/CZg==
Date: Thu, 18 Sep 2025 05:39:38 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: weishangjuan@eswincomputing.com
In-Reply-To: <20250918085903.3228-1-weishangjuan@eswincomputing.com>
References: <20250918085612.3176-1-weishangjuan@eswincomputing.com>
 <20250918085903.3228-1-weishangjuan@eswincomputing.com>
Message-Id: <175819197799.813528.5926397518793037522.robh@kernel.org>
Cc: vladimir.oltean@nxp.com, lizhi2@eswincomputing.com,
 anthony.l.nguyen@intel.com, jszhang@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, ningyu@eswincomputing.com,
 0x1207@gmail.com, kuba@kernel.org, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, jan.petrous@oss.nxp.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, rmk+kernel@armlinux.org.uk,
 yong.liang.choong@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 pinkesh.vaghela@einfochips.com, linmin@eswincomputing.com, edumazet@google.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, boon.khai.ng@altera.com,
 mcoquelin.stm32@gmail.com, inochiama@gmail.com, krzk+dt@kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v7 1/2] dt-bindings: ethernet: eswin:
 Document for EIC7700 SoC
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


On Thu, 18 Sep 2025 16:59:03 +0800, weishangjuan@eswincomputing.com wrote:
> From: Shangjuan Wei <weishangjuan@eswincomputing.com>
> 
> Add ESWIN EIC7700 Ethernet controller, supporting clock
> configuration, delay adjustment and speed adaptive functions.
> 
> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
> Signed-off-by: Shangjuan Wei <weishangjuan@eswincomputing.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/net/eswin,eic7700-eth.yaml       | 127 ++++++++++++++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml:127:7: [error] no new line character at the end of file (new-line-at-end-of-file)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250918085903.3228-1-weishangjuan@eswincomputing.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
