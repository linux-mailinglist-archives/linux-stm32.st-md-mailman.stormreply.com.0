Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F9DA20AA4
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jan 2025 13:37:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1E42C78026;
	Tue, 28 Jan 2025 12:37:33 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D544BC7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2025 12:37:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6B3945C5D95;
 Tue, 28 Jan 2025 12:36:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAA42C4CED3;
 Tue, 28 Jan 2025 12:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738067845;
 bh=qz3e8xDv9vNVbI2kX24dN6HQHDUseqJD3RxrmrJ0cpk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KlyH1pdJiKjGn8uLrDGey0+BR7Y1XDI7/k3IOlVaPDd2IG10n7iynKhrIxW1/9+t0
 QXsyA+5wubDIlfT4qOEvm+6bWHeQ/Dj3KzK8uAcqx7Nd9rFI3i1CZpAFiPdxtjFjlx
 eFiiDMOHVUGYVSv5ESIkT1Ng18KOneUYiiZKg8gdZRocGojxNST6AkvpiW+oP25sib
 hVU/b2cKo15dj/AspvsmoUGd6mvuYtpZ88RXutbZXqf+VcZnIGh+dXYe9omIsExEhY
 Zp6h7VPdoclI/eJSJ4QjzGyAQDHpyvyqaXXGGMyhOcIBk1q7XR6+sQvrrTNdA1HkzL
 HYBYWWWyjSsAA==
Date: Tue, 28 Jan 2025 12:37:19 +0000
From: Mark Brown <broonie@kernel.org>
To: patrice.chotard@foss.st.com
Message-ID: <ec35dbd3-5730-4cc8-8025-d349740d1ba5@sirena.org.uk>
References: <20250128081731.2284457-1-patrice.chotard@foss.st.com>
 <20250128081731.2284457-3-patrice.chotard@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20250128081731.2284457-3-patrice.chotard@foss.st.com>
X-Cookie: I never did it that way before.
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-spi@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/9] spi: stm32: Add OSPI driver
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
Content-Type: multipart/mixed; boundary="===============7228047861822142673=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7228047861822142673==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gwleQ6q+I0YDdApo"
Content-Disposition: inline


--gwleQ6q+I0YDdApo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 28, 2025 at 09:17:24AM +0100, patrice.chotard@foss.st.com wrote:

> +static int stm32_ospi_tx_poll(struct stm32_ospi *ospi, u8 *buf, u32 len, bool read)
> +{

> +	if (read)
> +		tx_fifo = stm32_ospi_read_fifo;
> +	else
> +		tx_fifo = stm32_ospi_write_fifo;

> +		tx_fifo(buf++, regs_base + OSPI_DR);

It feels like the _tx_poll and tx_fifo naming is a landmine waiting to
surprise people in the future.  The code sharing makes sense but the
naming is just looking to cause surprises, especially with it just being
a bool selecting read or write.

> +static int stm32_ospi_tx(struct stm32_ospi *ospi, const struct spi_mem_op *op)
> +{

> +       return stm32_ospi_tx_poll(ospi, buf, op->data.nbytes,
> +                                op->data.dir == SPI_MEM_DATA_IN);

Though the one caller is also using _tx only naming, it's a bit more
tied in with the op sending though.

> +	ctrl->mode_bits = SPI_RX_DUAL | SPI_RX_QUAD |
> +			  SPI_TX_DUAL | SPI_TX_QUAD |
> +			  SPI_TX_OCTAL | SPI_RX_OCTAL;
> +	ctrl->setup = stm32_ospi_setup;
> +	ctrl->bus_num = -1;
> +	ctrl->mem_ops = &stm32_ospi_mem_ops;
> +	ctrl->use_gpio_descriptors = true;
> +	ctrl->transfer_one_message = stm32_ospi_transfer_one_message;
> +	ctrl->num_chipselect = STM32_OSPI_MAX_NORCHIP;
> +	ctrl->dev.of_node = dev->of_node;

It looks like the controller only does half duplex as well so it should
set SPI_CONTROLLER_HALF_DUPLEX.

--gwleQ6q+I0YDdApo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeYz34ACgkQJNaLcl1U
h9DqGgf9GDpZoVHpFVphDLNJ/mT+2DuKd1ifuBqlhnL1uv3N5P3QycT2pGfzJm1x
rZYo8crCyUHSEEg8gJTFGRLvS4HMZnLiMPXAoO5haFS9MlQhkB9q4ycTO34H9ji9
fGJBMxjfNulkaQDTQCSTLQGLVG9btkfagUgPlT+44DJoJosJpgBxa/jRNV1aY5RV
mLna5fVv+UcrVwHwTcCks6+Zlo0yJLqnUNwO8Su5oJwaMZVgF6FzWHb9rtVmP5dX
Juozjf/iY5Q4GqgaFveLPKpGtdZ3ExFW/PozDcRWMaV0IgXJ050vnIYHjJztITmG
ywanYl7T6WSekQkkXSYYKko0xayygw==
=oZuU
-----END PGP SIGNATURE-----

--gwleQ6q+I0YDdApo--

--===============7228047861822142673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7228047861822142673==--
