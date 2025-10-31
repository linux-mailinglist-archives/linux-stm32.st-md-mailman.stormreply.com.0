Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 938FDC23EC5
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Oct 2025 09:53:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31539C62D3F;
	Fri, 31 Oct 2025 08:53:21 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28FB9C1A982
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Oct 2025 08:53:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BE686438E4;
 Fri, 31 Oct 2025 08:53:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11393C4CEF1;
 Fri, 31 Oct 2025 08:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761900797;
 bh=oK5nbB1LtOV7g02ZprYXgPq8GKEmIM9bcsXX+afO7Kc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DYEKqxr2pRl3d4ijIZ5ZZYCcw/en5aFTZ5TcxpfP/QJ/ZgAtoCyBwnXU3e4SfKfTW
 WIUQWa+Y0SU4tIKw68AHY4F928BIByHXV5FqmoMmT99dz6DbRvpPJozKjMgge7YxxH
 TjmTg8tIUZvZyr/dlja+uj+/OKCvrbuS2ANl8RXD0vOKF+goo9uuUDr52O1N6T6ciQ
 q/glR4+532A3FeETTACxSYqblvKYGQEfoNgo89uv/UL1TmYJyBrDHns/tDyk/7cvIq
 SqxnjErCtLd3Pf0aCARGpwKJ6mWGAVMfTes+Br3yGaakDaY4gK9hgAfh6tJ+pY1u7G
 HqtI34pitwAOA==
Date: Fri, 31 Oct 2025 09:53:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: weishangjuan@eswincomputing.com
Message-ID: <20251031-elated-radical-limpet-6a0eaf@kuoka>
References: <20251030085001.191-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251030085001.191-1-weishangjuan@eswincomputing.com>
Cc: vladimir.oltean@nxp.com, edumazet@google.com, jszhang@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 ningyu@eswincomputing.com, 0x1207@gmail.com, lizhi2@eswincomputing.com,
 kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org,
 jan.petrous@oss.nxp.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 rmk+kernel@armlinux.org.uk, yong.liang.choong@linux.intel.com,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com,
 linmin@eswincomputing.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, boon.khai.ng@altera.com,
 mcoquelin.stm32@gmail.com, inochiama@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: ethernet: eswin: fix yaml
	schema issues
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

On Thu, Oct 30, 2025 at 04:50:01PM +0800, weishangjuan@eswincomputing.com wrote:
> From: Shangjuan Wei <weishangjuan@eswincomputing.com>
> 
> Due to the detection of errors in the eswin mmc module
> regarding the eswin,hsp-sp-csr attributes in the
> eswin,eic7700-eth.yaml file, the link is as follows:
> https://lore.kernel.org/all/176096011380.22917.1988679321096076522.robh@kernel.org/

Drop, reported already says that.

Just say that this is one phandle with multiple arguments, so the syntax
should be in the form of:

> Therefore, the eswin,hsp-sp-csr attributes of the eic7700-eth.yaml file
> regarding eswin and hsp-sp-csr will be changed to the form of:

> items:
>   - items:
>       - description: ...
>       - description: ...
>       - description: ...
>       - description: ...
> 
> The MMC,Ethernet,and USB modules of eswin vendor have defined
> eswin,hsp-sp-csr attribute in YAML. In order to be consistent
> with the property description of MMC,USB, I have modified the
> description content of eswin,hsp-sp-csr attribute in Ethernet YAML.

That's redundant paragraph. Write concise messages describing the
problem, not some background or unrelated bindings. See also submitting
patches about preferred English form.

> 
> Fixes: 888bd0eca93c("dt-bindings: ethernet: eswin: Document for EIC7700 SoC")

Missing space, missing checkpatch.

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

With first paragraph and fixes tag corrected:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
