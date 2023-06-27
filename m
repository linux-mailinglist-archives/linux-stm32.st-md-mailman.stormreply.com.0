Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3355E73F7C8
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jun 2023 10:51:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E81FC6B44D;
	Tue, 27 Jun 2023 08:51:40 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9428C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jun 2023 08:51:39 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qE4Og-0007V2-F6; Tue, 27 Jun 2023 10:50:02 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qE4OT-00AOye-Qh; Tue, 27 Jun 2023 10:49:49 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qE4OS-000CFt-WF; Tue, 27 Jun 2023 10:49:49 +0200
Date: Tue, 27 Jun 2023 10:49:48 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <20230627084948.nwp7gmwpdtadcfhk@pengutronix.de>
References: <20230627071707.77659-1-frank.li@vivo.com>
MIME-Version: 1.0
In-Reply-To: <20230627071707.77659-1-frank.li@vivo.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: heiko@sntech.de, hayashi.kunihiko@socionext.com, rafael@kernel.org,
 amitk@kernel.org, linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
 jernej.skrabec@gmail.com, miquel.raynal@bootlin.com,
 srinivas.pandruvada@linux.intel.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, bchihi@baylibre.com,
 florian.fainelli@broadcom.com, daniel.lezcano@linaro.org,
 chi.minghao@zte.com.cn, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, agross@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-imx@nxp.com, wenst@chromium.org,
 rui.zhang@intel.com, thara.gopinath@gmail.com, kernel@pengutronix.de,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, linux-mediatek@lists.infradead.org,
 mmayer@broadcom.com, matthias.bgg@gmail.com, tglx@linutronix.de,
 DLG-Adam.Ward.opensource@dm.renesas.com, johan+linaro@kernel.org,
 angelogioacchino.delregno@collabora.com, linux-arm-kernel@lists.infradead.org,
 niklas.soderlund+renesas@ragnatech.se, andersson@kernel.org,
 linux-kernel@vger.kernel.org, shangxiaojing@huawei.com,
 konrad.dybcio@linaro.org, mcoquelin.stm32@gmail.com, shawnguo@kernel.org
Subject: Re: [Linux-stm32] [PATCH 01/15] genirq/devres: Add error
 information printing for devm_request_threaded_irq()
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
Content-Type: multipart/mixed; boundary="===============6419198208031659022=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6419198208031659022==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fbpfi3z6hsdafixb"
Content-Disposition: inline


--fbpfi3z6hsdafixb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Jun 27, 2023 at 03:16:52PM +0800, Yangtao Li wrote:
> Ensure that all error handling branches print error information. In this
> way, when this function fails, the upper-layer functions can directly
> return an error code without missing debugging information. Otherwise,
> the error message will be printed redundantly or missing.
>=20
> There are more than 700 calls to the devm_request_threaded_irq method.
> If error messages are printed everywhere, more than 1000 lines of code
> can be saved by removing the msg in the driver.
>=20
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  kernel/irq/devres.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/kernel/irq/devres.c b/kernel/irq/devres.c
> index f6e5515ee077..94039a915218 100644
> --- a/kernel/irq/devres.c
> +++ b/kernel/irq/devres.c
> @@ -58,8 +58,10 @@ int devm_request_threaded_irq(struct device *dev, unsi=
gned int irq,
> =20
>  	dr =3D devres_alloc(devm_irq_release, sizeof(struct irq_devres),
>  			  GFP_KERNEL);
> -	if (!dr)
> +	if (!dr) {
> +		dev_err(dev, "Failed to allocate device resource data\n");
>  		return -ENOMEM;
> +	}
> =20
>  	if (!devname)
>  		devname =3D dev_name(dev);
> @@ -67,6 +69,7 @@ int devm_request_threaded_irq(struct device *dev, unsig=
ned int irq,
>  	rc =3D request_threaded_irq(irq, handler, thread_fn, irqflags, devname,
>  				  dev_id);
>  	if (rc) {
> +		dev_err(dev, "Failed to request threaded irq\n");
>  		devres_free(dr);
>  		return rc;
>  	}

My personal opinion is that generic allocation functions should be
silent. The reason is that the consuming driver is in a better position
to emit a helpful error message.

While there is some room to improvment in this generic variant (by
mentioning the error code and maybe also the irq number), consider a
device that has up to 3 irqs and sometimes only 1. So the driver might
want to handle some irq requesting silently. And also for non-optional
irqs

	mybus:mydev: Failed to request TX irq (EBUSY)

is much more helpful than

	mybus:mydev: Failed to request threaded irq

(Hint: "threaded" is not a helpful information here either.)

Yes, a message in the driver has the downside of making the kernel image
(or module) bigger, but the added value is IMHO worth that.

Also you might want to handle -EPROBE_DEFER and not emit a message then?
(Not sure if request_threaded_irq can return that.)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--fbpfi3z6hsdafixb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSaoqwACgkQj4D7WH0S
/k66Lwf9Hq5nC1KErm/UPzhqFFiQaUkm5tlRfhc0HKwY231RXIl8U/sEUzFOmVp1
QoBQ3HUogIHlgELx2qVVR9friYW9RRjYQUIFa1Sr1AtICCHEbmveRdjqF07bZTdw
czHwMp90yKmH9mbGpEb7JfmhP+Gl3EJHkFZsfr9AniTRYyiDRNnKIOY8GbHv+Uvz
vtzJx3uAlv/rcGSMxY+OKqTl24TYEQAoL6nWjp2tDuv2qgqUyCXBFsNG3/NfKsED
ldiOz1Wlgger5JmYqUI2EikRolCllLBqEhUMZVTFdtckl0N82zUG+SKNhaSK37yP
Q6KBysmk81RWjCHUIWVmIbxhxxgdUQ==
=Okxi
-----END PGP SIGNATURE-----

--fbpfi3z6hsdafixb--

--===============6419198208031659022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6419198208031659022==--
