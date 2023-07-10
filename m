Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D92768DA5
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jul 2023 09:16:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DA42C6C835;
	Mon, 31 Jul 2023 07:16:23 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C353C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 16:01:20 +0000 (UTC)
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b]
 helo=bjornoya.blackshift.org) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1qItIz-0006h7-IH; Mon, 10 Jul 2023 18:00:05 +0200
Received: from pengutronix.de (unknown [172.20.34.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id 0B1351ED16C;
 Mon, 10 Jul 2023 15:59:56 +0000 (UTC)
Date: Mon, 10 Jul 2023 17:59:55 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <20230710-doze-scared-9f0a2e1a9125-mkl@pengutronix.de>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-10-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20230710154932.68377-10-andriy.shevchenko@linux.intel.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:b01:1d::7b
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Approved-At: Mon, 31 Jul 2023 07:16:18 +0000
Cc: Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-rockchip@lists.infradead.org,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Radu Pirea <radu_nicolae.pirea@upb.ro>, linux-trace-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Steven Rostedt <rostedt@goodmis.org>, Sanjay R Mehta <sanju.mehta@amd.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Orson Zhai <orsonzhai@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, linux-spi@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v2 09/15] spi: Use struct_size() helper
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
Content-Type: multipart/mixed; boundary="===============7989985916327181418=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7989985916327181418==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fkfcsps3yw5kjzrk"
Content-Disposition: inline


--fkfcsps3yw5kjzrk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 10.07.2023 18:49:26, Andy Shevchenko wrote:
> Prefer struct_size() over open-coded versions.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  include/linux/spi/spi.h | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>=20
> diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
> index c9479badf38c..9fb8efb068c6 100644
> --- a/include/linux/spi/spi.h
> +++ b/include/linux/spi/spi.h
> @@ -17,6 +17,7 @@
>  #include <linux/minmax.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/mutex.h>
> +#include <linux/overflow.h>
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
>  #include <linux/smp.h>
> @@ -1095,6 +1096,8 @@ struct spi_transfer {
>   * @state: for use by whichever driver currently owns the message
>   * @resources: for resource management when the spi message is processed
>   * @prepared: spi_prepare_message was called for the this message
> + * @t: for use with spi_message_alloc() when message and transfers have
> + *	been allocated together
>   *
>   * A @spi_message is used to execute an atomic sequence of data transfer=
s,
>   * each represented by a struct spi_transfer.  The sequence is "atomic"
> @@ -1147,6 +1150,9 @@ struct spi_message {
> =20
>  	/* List of spi_res reources when the spi message is processed */
>  	struct list_head        resources;
> +
> +	/* For embedding transfers into the memory of the message */
> +	struct spi_transfer	t[];

You might want to use the DECLARE_FLEX_ARRAY helper here.

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--fkfcsps3yw5kjzrk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmSsKvgACgkQvlAcSiqK
BOgtxwf/Yz15ymm8GOJJtFmUerpE4jpOZcNfOw1mDTpDDgDH+8CXkQfj2uE13kRU
xmZmpKSAMlsxxmOIGsv8VL18I9YKzWY9wk4vu5oovzx44NHON+6ivyODkaJdH2w9
kOVb4XiHGF0bhFsC3TJ4HZSUlG3EbFNnc0nuj/IvF6VEoldwbjSR6R5ZR6+EX47u
h77RsJnmXXbOKbOseq0nlPxZYkFSR03Hzey7BMzmHYQ93COdGDhQqI0kNbwrkD5F
qpdpYHa26+CLsV+iBftiTk/C49nxRM0cvs4xqUDaZU1rzd2tlbhN28dsuGJ8zQL1
T+7Bl7/j5IRqJUJiKB8YUQNVj2KrOg==
=a9WN
-----END PGP SIGNATURE-----

--fkfcsps3yw5kjzrk--

--===============7989985916327181418==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7989985916327181418==--
