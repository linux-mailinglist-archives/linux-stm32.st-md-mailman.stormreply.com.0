Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEAAB50AD7
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Sep 2025 04:10:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DF8AC3FACB;
	Wed, 10 Sep 2025 02:10:19 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E41BC3FACA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 02:10:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6971C44713;
 Wed, 10 Sep 2025 02:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EB0DC4CEF8;
 Wed, 10 Sep 2025 02:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757470216;
 bh=/NMz5XCTrhQRZtCAewkKfQnSTyNwhw8EMFsxenzy7vM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bGQRiSC6AM+KaTvn8KrTJ3VH1tnQsN6wTWZGjGeB/WWsq3ERmw6Pv1i3Rcy2GzWur
 ZbUTRPHXmkm03tv3xpfu8kx6ZFO3R1GFIlFo7zBFf5MPgPP/VEkdB9n4KgqnJeLuVI
 cYDLG0Ug6Qvlhbmur/RYnCa7GoQRg/GsWFUp1OWL+45O793A7NV2fnGaUU0mUqyUcJ
 9McAK6Q33tliEqVCxqn+Ddvpl7srf6oGXYrZZDc6pwZwMXMbGrIPAK6C1WsCLZ31RP
 BheSW+JiS1Pl0ygcnvXntu+5P3uqjKFwBCvBplTsfQQ6b4YNx0FjcyZamw53z9EEVY
 1h5O2/SX+iOlQ==
Date: Tue, 9 Sep 2025 21:10:15 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Message-ID: <175747021462.3634607.17013207905541885888.robh@kernel.org>
References: <20250905135547.934729-1-antonio.borneo@foss.st.com>
 <20250905135547.934729-9-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250905135547.934729-9-antonio.borneo@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 linux-gpio@vger.kernel.org, Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 8/9] dt-bindings: pinctrl: stm32:
 Support I/O synchronization parameters
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


On Fri, 05 Sep 2025 15:55:46 +0200, Antonio Borneo wrote:
> Document the support of the I/O synchronization parameters:
> - skew-delay;
> - skew-delay-direction;
> - st,io-sync.
> 
> Require 'skew-delay-direction' when 'skew-delay' is non zero.
> Allow the new properties only with compatibles that support them.
> Add an example that uses all the new properties.
> 
> Co-developed-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> ---
>  .../bindings/pinctrl/st,stm32-pinctrl.yaml    | 92 +++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
