Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F333D7BB526
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Oct 2023 12:29:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5D37C6C836;
	Fri,  6 Oct 2023 10:29:38 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CAB3FC6C835
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Oct 2023 10:29:37 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-9b6559cbd74so364395766b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Oct 2023 03:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696588177; x=1697192977;
 darn=st-md-mailman.stormreply.com; 
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9FTsAYhfYTssJFz7CdhaD+H1tNbJvHmttIr6I4ZAM+s=;
 b=ahTx7ul5gdYfpSjFVK5hKUjk0pBp3ABd4TafHQJfQrWSGoCR3V+0HLZ0p+ZIgIFzue
 hDiWpnnOdTdLBrGYtf5eOx/bKhlt9ip2YQJyOr5Ar55E2kex1wlyZoNpAX1CWqGFJ5cv
 M2DbkRRtcb6uXy+kqXRTePXr6852lUoBMoOQZjQP8+EVr+3V/Gf+cE6+2ZsTDuec86TP
 IVhGFNOmvviD3HPes754CRqI8dQyf9WTRlyGwaesat+oTvQ4QAXiZBXOL3jozorWdD+L
 m1veakxyWgqG+ELsikW/nYvigsvHk0Zi5byI9Qq7PLPyGqmg/LVeIfG7V0kk6nG++0HU
 u8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696588177; x=1697192977;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9FTsAYhfYTssJFz7CdhaD+H1tNbJvHmttIr6I4ZAM+s=;
 b=Yc2jrJ7S3Sn3Yb82cpD3hwpLB4TnWebSHeKmshIEhY6RsiacKZejKZq32saVFdzdcB
 2vHnvy5Wajq+vrFZegiGgkhAj2JGmHSCKmIDfFqt/lm4OQcForRYgRSNvFUbUOip51Ge
 oQMKS8OUhghJSzf10jOaGYFxC63uz10sUVM6yxFnKOiUfqGZsxfI82ipFnTdhbOFVeYI
 X9aIdUWKCCck4ukb1iy++PSKNgonCj6hIyoqQWuf7HFgnIl21/rGX9yrlQI8YnZQvj6g
 9tmJxrIQlazM1R3gGDrPuxzlXi74nIUfgZoQ6HLjldo87VWm5VDrZJqisgPhg3AtFbRR
 8xaw==
X-Gm-Message-State: AOJu0YxrZ0xLvFUxRH7WrAi1ji36wiraruEnPM77bnLKp6VUf7nJDISx
 kMZi4hfNYYBOOQ0i2YVuVB4=
X-Google-Smtp-Source: AGHT+IF29lLhqYu1W7nFQy9/ogamXAd4uztCA0mlziEcK+D8YlweNIqxDxKUo5cSzTjeFjEwc2s/Ew==
X-Received: by 2002:a17:907:7857:b0:9b2:b153:925 with SMTP id
 lb23-20020a170907785700b009b2b1530925mr6657004ejc.21.1696588177046; 
 Fri, 06 Oct 2023 03:29:37 -0700 (PDT)
Received: from orome.fritz.box
 (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a17090640cb00b00977eec7b7e8sm2657390ejk.68.2023.10.06.03.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 03:29:36 -0700 (PDT)
Date: Fri, 6 Oct 2023 12:29:34 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Sean Young <sean@mess.org>
Message-ID: <ZR_hjjS1VMAPLYVI@orome.fritz.box>
References: <cover.1696156485.git.sean@mess.org>
 <1bd5241d584ceb4d6b731c4dc3203fb9686ee1d1.1696156485.git.sean@mess.org>
MIME-Version: 1.0
In-Reply-To: <1bd5241d584ceb4d6b731c4dc3203fb9686ee1d1.1696156485.git.sean@mess.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
Cc: linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Daire McNamara <daire.mcnamara@microchip.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/2] pwm: make it possible to apply pwm
 changes in atomic context
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
Content-Type: multipart/mixed; boundary="===============7305421547395008320=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7305421547395008320==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mL8QfLbOLLpS8F7R"
Content-Disposition: inline


--mL8QfLbOLLpS8F7R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 01, 2023 at 11:40:29AM +0100, Sean Young wrote:
[...]
> diff --git a/include/linux/pwm.h b/include/linux/pwm.h
> index d2f9f690a9c1..c94894ffa4c4 100644
> --- a/include/linux/pwm.h
> +++ b/include/linux/pwm.h
> @@ -287,6 +287,7 @@ struct pwm_ops {
>   * @ops: callbacks for this PWM controller
>   * @base: number of first PWM controlled by this chip
>   * @npwm: number of PWMs controlled by this chip
> + * @can_sleep: can the driver sleep in pwm_apply_state
>   * @of_xlate: request a PWM device given a device tree PWM specifier
>   * @of_pwm_n_cells: number of cells expected in the device tree PWM spec=
ifier
>   * @list: list node for internal use
> @@ -297,6 +298,7 @@ struct pwm_chip {
>  	const struct pwm_ops *ops;
>  	int base;
>  	unsigned int npwm;
> +	bool can_sleep;

Can we please call this "might_sleep"?

> =20
>  	struct pwm_device * (*of_xlate)(struct pwm_chip *chip,
>  					const struct of_phandle_args *args);
> @@ -380,6 +382,18 @@ static inline void pwm_disable(struct pwm_device *pw=
m)
>  	pwm_apply_state(pwm, &state);
>  }
> =20
> +/**
> + * pwm_can_sleep() - can a pwm driver sleep in pwm_apply_state()
> + * @pwm: PWM device
> + *
> + * Returns: true if the driver may sleep, false if pwm_apply_state()
> + * can be called from atomic context.
> + */
> +static inline bool pwm_can_sleep(struct pwm_device *pwm)

And this one pwm_might_sleep()? I don't see why we need to deviate from
the nomenclature that the core introduced.

Thierry

--mL8QfLbOLLpS8F7R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmUf4Y4ACgkQ3SOs138+
s6E4FBAAg0tEpfYfp9Yw8ogU74h4roxmvYnytJpFXp2sixtyVANVEMQepzR2LQIE
CqWassqeXgYIpkDitSttcCUwtGZ31Klbd+7irCzb1X75W6u6xbsbhAgiQ+edclP2
5+C0wAerMMAavdgn7hYf1JYpupZM9H5/RvZLcSkywvpfHEfzrOFU20ackUlLiXsG
Lc6RTVMwki88bxnA5WerSZuTIOYSVl0Pkg+4djuN6xtdv4zF53Cfkz3o7d7dc5US
lSxjcikOpDealmS75qLW61PWWiDC8AZXxZysVjwuiwP0xnIk52KhHMsQeignaZ2b
G5NdTZZHyLpfF/HV23LdQKCOP3/J/50lkO1pslq8VcccJYqeOFhreG7MaCax2i7b
DZi0KEX/MGGRmA7hZj9014u5Q1KfvClbrWuctt9SLbbcWLeV2YW+MOcb/PSoj82D
DE9u62SJ4/xck9btpwuFXQ47Smxlub8qeOEh941qJsImqskMUJV42BI1mSITOexx
Mnfi9SD5H5+KxEkr39VbAA55ypAS1DNS/BubpmI/kPFXz01tjUxFtqLnQxl1ANVB
QnIUADVzpB0kmmJoUyiLU0FWLaExWqfrJDSzbt/WDeKaS4O5P1VfrCOsPcPelIYs
xP5n3y/MN01SRytptbW9Z7+tJBSJSrP2M8gt2JnmPFQxCe+ISto=
=LVfE
-----END PGP SIGNATURE-----

--mL8QfLbOLLpS8F7R--

--===============7305421547395008320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7305421547395008320==--
