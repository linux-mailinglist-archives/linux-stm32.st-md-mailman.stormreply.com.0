Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E841263EA6E
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Dec 2022 08:42:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D96AC65073;
	Thu,  1 Dec 2022 07:42:01 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7BEACC03FC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Dec 2022 02:41:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C136061E43;
 Thu,  1 Dec 2022 02:41:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40610C433B5;
 Thu,  1 Dec 2022 02:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669862478;
 bh=oEKpzlNT5/2REuZbJ9nJL8V6rmg/O7EETT/KejHSD8k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TH8159Vsmt/10ITe/zhNEMAr0DJShK7lsDLNDN2pIZAVofrn3gusqAdnBs2Qu1cSN
 XCcRLrdtEkYyNEI8SEx6SJRIKDIfDVpLhJHBOP8HqdCgkPwJb3zObY5B7KiqXqV5dU
 YfnDxebKZS69mB2aEBYlCb+U3U7FjKzExxd/CI1VOI09SsnQ0ZvEFiiDbtdXex5IWG
 DBHET0gvgxZrW9389IzXKRfWjYTgc2EntD3p+73FzHGNoSLfnluPj2RUUWlbsAOWtR
 7osJ2K8rd4L8EqCVdL03V/id7vZ6u9INSzhje+ZXfzQM9dAVuQaVr5VyJGNqZHVtHm
 ohZr0MuVoVdZQ==
Date: Thu, 1 Dec 2022 10:41:06 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <Y4gUQhdeZGm67Js2@google.com>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
 <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
X-Mailman-Approved-At: Thu, 01 Dec 2022 07:42:01 +0000
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Satya Priya <quic_c_skakit@quicinc.com>, Pavel Machek <pavel@ucw.cz>,
 Guenter Roeck <groeck@chromium.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Fabio Estevam <festevam@gmail.com>, linux-riscv@lists.infradead.org,
 linux-leds@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
 chrome-platform@lists.linux.dev, Florian Fainelli <f.fainelli@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Sean Anderson <sean.anderson@seco.com>,
 Kevin Hilman <khilman@baylibre.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Michal Simek <michal.simek@xilinx.com>,
 linux-stm32@st-md-mailman.stormreply.com, Hammer Hsieh <hammerh0314@gmail.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-pwm@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Stephen Boyd <swboyd@chromium.org>, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org,
 Scott Branden <sbranden@broadcom.com>, Bjorn Andersson <andersson@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Michael Walle <michael@walle.cc>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v2 01/11] pwm: Make .get_state() callback
 return an error code
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Wed, Nov 30, 2022 at 04:21:38PM +0100, Uwe Kleine-K=F6nig wrote:
> diff --git a/drivers/pwm/pwm-cros-ec.c b/drivers/pwm/pwm-cros-ec.c
> index 7f10f56c3eb6..11684edc0620 100644
> --- a/drivers/pwm/pwm-cros-ec.c
> +++ b/drivers/pwm/pwm-cros-ec.c
> @@ -183,8 +183,8 @@ static int cros_ec_pwm_apply(struct pwm_chip *chip, s=
truct pwm_device *pwm,
>  	return 0;
>  }
>  =

> -static void cros_ec_pwm_get_state(struct pwm_chip *chip, struct pwm_devi=
ce *pwm,
> -				  struct pwm_state *state)
> +static int cros_ec_pwm_get_state(struct pwm_chip *chip, struct pwm_devic=
e *pwm,
> +				 struct pwm_state *state)
>  {
>  	struct cros_ec_pwm_device *ec_pwm =3D pwm_to_cros_ec_pwm(chip);
>  	struct cros_ec_pwm *channel =3D pwm_get_chip_data(pwm);
> @@ -193,7 +193,7 @@ static void cros_ec_pwm_get_state(struct pwm_chip *ch=
ip, struct pwm_device *pwm,
>  	ret =3D cros_ec_pwm_get_duty(ec_pwm, pwm->hwpwm);
>  	if (ret < 0) {
>  		dev_err(chip->dev, "error getting initial duty: %d\n", ret);
> -		return;
> +		return 0;
>  	}
>  =

>  	state->enabled =3D (ret > 0);
> @@ -212,6 +212,8 @@ static void cros_ec_pwm_get_state(struct pwm_chip *ch=
ip, struct pwm_device *pwm,
>  		state->duty_cycle =3D channel->duty_cycle;
>  	else
>  		state->duty_cycle =3D ret;
> +
> +	return 0;
>  }

For the cros-ec part:
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
