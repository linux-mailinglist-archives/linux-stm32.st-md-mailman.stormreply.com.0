Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B886AF5F2C
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Jul 2025 18:54:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1038C3F93A;
	Wed,  2 Jul 2025 16:53:58 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08C7EC35E00
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Jul 2025 16:53:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C4F7CA530DC;
 Wed,  2 Jul 2025 16:53:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DE08C4CEE7;
 Wed,  2 Jul 2025 16:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751475236;
 bh=SPe4Uai1bMQkO9HlAyYOM9wfRpZK1LE+tL6F2AD8u1I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mKlMaTth9qVjFXD1OrmZjGPDo89B+QjHzvGZv11qCVAmnmt/fVk1mV1FCiB8JKdNf
 D6Vro1jZ4YN3ADYJXKWzZZ0cMndBt84UGCpSFWW6ygeTgBzpcY3zazVZgGcp/pOmZn
 ogalxEGv0qRjivDYljIcQikdjDt35QapyEsoKDEDNgjC1H5OZtoSx8r+0M/n89FHhv
 0FYBMICOQWnsCj5jPKwA8Rc/Eab0BMqBGNMlX10Iu1ef++FnlKUjF7Yzo+gSzkKtv1
 iie6R/1OsgeHiMDbSfpx/RKVgdJAKwTyD8furAM25FZyQPwLA+Gzt81wBv3ZltyBeM
 R/NPEBCybHM9g==
Date: Wed, 2 Jul 2025 11:53:55 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Matthew Gerlach <matthew.gerlach@altera.com>
Message-ID: <175147523465.1908626.13539013933475728908.robh@kernel.org>
References: <20250630213748.71919-1-matthew.gerlach@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250630213748.71919-1-matthew.gerlach@altera.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, dinguyen@kernel.org,
 netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Mun Yew Tham <mun.yew.tham@altera.com>, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v7] dt-bindings: net: Convert
 socfpga-dwmac bindings to yaml
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


On Mon, 30 Jun 2025 14:37:48 -0700, Matthew Gerlach wrote:
> Convert the bindings for socfpga-dwmac to yaml. Since the original
> text contained descriptions for two separate nodes, two separate
> yaml files were created.
> 
> Signed-off-by: Mun Yew Tham <mun.yew.tham@altera.com>
> Signed-off-by: Matthew Gerlach <matthew.gerlach@altera.com>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
> v7:
>  - Add compatible definition for Arria10.
>  - Update iommus to maxItems: 2.
> 
> v6:
>  - Fix reference to altr,gmii-to-sgmii-2.0.yaml in MAINTAINERS.
>  - Add Reviewed-by:
> 
> v5:
>  - Fix dt_binding_check error: comptabile.
>  - Rename altr,gmii-to-sgmii.yaml to altr,gmii-to-sgmii-2.0.yaml
> 
> v4:
>  - Change filename from socfpga,dwmac.yaml to altr,socfpga-stmmac.yaml.
>  - Updated compatible in select properties and main properties.
>  - Fixed clocks so stmmaceth clock is required.
>  - Added binding for altr,gmii-to-sgmii.
>  - Update MAINTAINERS.
> 
> v3:
>  - Add missing supported phy-modes.
> 
> v2:
>  - Add compatible to required.
>  - Add descriptions for clocks.
>  - Add clock-names.
>  - Clean up items: in altr,sysmgr-syscon.
>  - Change "additionalProperties: true" to "unevaluatedProperties: false".
>  - Add properties needed for "unevaluatedProperties: false".
>  - Fix indentation in examples.
>  - Drop gmac0: label in examples.
>  - Exclude support for Arria10 that is not validating.
> ---
>  .../bindings/net/altr,gmii-to-sgmii-2.0.yaml  |  49 ++++++
>  .../bindings/net/altr,socfpga-stmmac.yaml     | 166 ++++++++++++++++++
>  .../devicetree/bindings/net/socfpga-dwmac.txt |  57 ------
>  MAINTAINERS                                   |   7 +-
>  4 files changed, 221 insertions(+), 58 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/altr,gmii-to-sgmii-2.0.yaml
>  create mode 100644 Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
>  delete mode 100644 Documentation/devicetree/bindings/net/socfpga-dwmac.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
