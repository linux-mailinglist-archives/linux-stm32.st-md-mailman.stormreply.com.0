Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1A7B3450A
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Aug 2025 17:04:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D42EAC3FAD8;
	Mon, 25 Aug 2025 15:04:28 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CB7BC3FAD7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Aug 2025 15:04:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B06A16023C;
 Mon, 25 Aug 2025 15:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1593DC4CEED;
 Mon, 25 Aug 2025 15:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756134265;
 bh=moDtz0XRlITtrg1yOQpLUA9pOtorCAl76Jnt5I6UpuI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=P7z9FpKoaN4Js7ubmjGR6zmu0rHzXl4k/Q1LRQZykuA0z3Doft4uPAABcvr8KPsxC
 8lQNSjZsBzF6BtwiqhYsXFCx57R/jWkzvB1OYP/y5dtNjUKjJHgqD8m+BW63LKDdQO
 PCr9G+XMQpHS1W2auotIayFXD94N3QZT5xOeM/QQ1gTKZ+BK2zV2aG8lTO+eDTzJMb
 ANuoyx2sbcwzRbmoysIZyb/aq3TKkxZbiHRyNX75Zgtn+LKJDpjFsGJIYM1q6mkAJt
 If+p06JGCpCUMMx6VUtvJBcXhF3JcZULqN9D3d2rJUpxBN2wwJWI2Bba7HKV1NASky
 lGNgd7205AQNQ==
Date: Mon, 25 Aug 2025 16:03:55 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Message-ID: <20250825160355.50e8cbfd@jic23-huawei>
In-Reply-To: <20250825135401.1765847-5-sakari.ailus@linux.intel.com>
References: <20250825135401.1765847-1-sakari.ailus@linux.intel.com>
 <20250825135401.1765847-5-sakari.ailus@linux.intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Crt Mori <cmo@melexis.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Peter Zijlstra <peterz@infradead.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Frank Li <Frank.Li@nxp.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "Rob Herring \(Arm\)" <robh@kernel.org>, linux-iio@vger.kernel.org,
 Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
 Francesco Dolcini <francesco@dolcini.it>, Samuel Holland <samuel@sholland.org>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Abhash Jha <abhashkumarjha123@gmail.com>,
 Haibo Chen <haibo.chen@nxp.com>,
 Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>,
 Marek Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel@lists.infradead.org, Bo Liu <liubo03@inspur.com>,
 Sean Nyekjaer <sean@geanix.com>, chuguangqing <chuguangqing@inspur.com>,
 David Lechner <dlechner@baylibre.com>, Waqar Hameed <waqar.hameed@axis.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 =?UTF-8?B?QmFybmFiw6FzIEN6?= =?UTF-8?B?w6ltw6Fu?=
 <barnabas.czeman@mainlining.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Vasileios Amoiridis <vassilisamir@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Jakob Hauser <jahau@rocketmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Eugen Hristev <eugen.hristev@linaro.org>, Andreas Klinger <ak@it-klinger.de>,
 Han Xu <han.xu@nxp.com>, Julien Stephan <jstephan@baylibre.com>,
 Alexandru Ardelean <aardelean@baylibre.com>, Andy Shevchenko <andy@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Per-Daniel Olsson <perdaniel.olsson@axis.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Gustavo Vaz <gustavo.vaz@usp.br>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, David Laight <david.laight@aculab.com>,
 =?UTF-8?B?Sm/Do28=?= Paulo =?UTF-8?B?R29uw6dhbHZlcw==?=
 <jpaulo.silvagoncalves@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rayyan Ansari <rayyan@ansari.sh>, Cai Huoqing <cai.huoqing@linux.dev>,
 Shawn Guo <shawnguo@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Hans de Goede <hansg@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [Linux-stm32] [PATCH v3 04/12] iio: common: Remove redundant
 pm_runtime_mark_last_busy() calls
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

On Mon, 25 Aug 2025 16:53:53 +0300
Sakari Ailus <sakari.ailus@linux.intel.com> wrote:

> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Applied.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
