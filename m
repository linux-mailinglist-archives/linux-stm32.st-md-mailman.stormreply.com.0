Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AFCAD6A38
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 10:16:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91063C36B27;
	Thu, 12 Jun 2025 08:16:52 +0000 (UTC)
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 094ACC36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 08:16:51 +0000 (UTC)
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id E7AD31F918;
 Thu, 12 Jun 2025 10:16:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
 s=default; t=1749716211;
 bh=3VR5y0yctXr4XPaqy1aKaXDWdxCZQO5tubS3+gM8YMY=; h=From:To:Subject;
 b=edDjj3BdUD1gnQTpkEmdkcP/wnYtbxZpJQrdMyg+rC/QFXCa+JIfLShC/OZlNzqXg
 siW651XVhV8xzKaR41qq0o55LePizdTglIfnsFfkIaei2IWPK3XPjDRCGLc7DtWliH
 15l0Ln5GvzV7C3u1AzGxO8E7fdhQ89PfiYARKBmK48unDPrYwQfMQ+8335QnqrCBIP
 oKNsXEW1QdCtN8RwAAmRcx1x6nysHGImfBL5SI6TncUmcQVSS6d9MpCKVqT9mRVOfU
 ivF4lOQaobzt5BZ2WKmfUn5UbOrNE457dQvNqLFBpOHibGKmiOQM6A4fCPO2K00GKU
 kwXJvloiVXvFg==
Date: Thu, 12 Jun 2025 10:16:46 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: David Lechner <dlechner@baylibre.com>
Message-ID: <20250612081646.GA316795@francesco-nb>
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
 <20250611-iio-zero-init-stack-with-instead-of-memset-v1-9-ebb2d0a24302@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-9-ebb2d0a24302@baylibre.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-iio@vger.kernel.org,
 Petre Rodan <petre.rodan@subdimension.ro>,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 linux-stm32@st-md-mailman.stormreply.com, Lars-Peter Clausen <lars@metafoo.de>,
 Francesco Dolcini <francesco@dolcini.it>, linux-rockchip@lists.infradead.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Jacopo Mondi <jacopo@jmondi.org>, kernel@pengutronix.de,
 Michael Hennerich <michael.hennerich@analog.com>,
 Mudit Sharma <muditsharma.info@gmail.com>, linux-mediatek@lists.infradead.org,
 Andreas Klinger <ak@it-klinger.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 Leonard =?iso-8859-1?Q?G=F6hrs?= <l.goehrs@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org,
 Roan van Dijk <roan@protonic.nl>,
 =?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 09/28] iio: adc: ti-ads1119: use = { }
	instead of memset()
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

On Wed, Jun 11, 2025 at 05:39:01PM -0500, David Lechner wrote:
> Use { } instead of memset() to zero-initialize stack memory to simplify
> the code.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
