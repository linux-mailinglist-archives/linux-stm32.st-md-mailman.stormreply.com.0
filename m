Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87361AD9CAB
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Jun 2025 14:22:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B51DC36B3D;
	Sat, 14 Jun 2025 12:22:07 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF275C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Jun 2025 12:22:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DCD5CA46DDC;
 Sat, 14 Jun 2025 12:22:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21CA6C4CEEB;
 Sat, 14 Jun 2025 12:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749903724;
 bh=rGBMrxAgX1GCHG976Dof9q8HsYSXp+4s7rfg/Gplu5A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ObgiNchWi3Q5QDAhQdCv9+9wM+/Y73M6FLFMuT1AL13DUqXoevDQbIE7FPcMWErzF
 C2sHbXf/5OPnZzoSPF5TfoXuedHe7TK1j/6FNcRGc7mvzemEn8Zavwu6S6xSSz/Sft
 zw8KfrwO0JhiVw0cUCtqDIV/gAx5fme+3fzaCgzOYmS2oykxN33M7pl5WD0F4AzNrn
 xwKZrlAiL+KvXJpMKO++Tx4aCFA496wFKbZXAnqntqbP6QdHCsBFXVaL0dNk6es71L
 mo+Z48ZH+07MZORsjap81CJg82mJ8dVtw+HbLZE+WZAE8XphIYu25AKi45mXs+EgXn
 XX+d9+LHp5hBw==
Date: Sat, 14 Jun 2025 13:21:50 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Message-ID: <20250614132150.6f4a29a3@jic23-huawei>
In-Reply-To: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-16-ebb2d0a24302@baylibre.com>
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
 <20250611-iio-zero-init-stack-with-instead-of-memset-v1-16-ebb2d0a24302@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Heiko Stuebner <heiko@sntech.de>, linux-iio@vger.kernel.org,
 Petre Rodan <petre.rodan@subdimension.ro>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 linux-stm32@st-md-mailman.stormreply.com, Lars-Peter Clausen <lars@metafoo.de>,
 Francesco Dolcini <francesco@dolcini.it>, linux-rockchip@lists.infradead.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 =?UTF-8?B?T25kxZllag==?= Jirman <megi@xff.cz>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Jacopo Mondi <jacopo@jmondi.org>, kernel@pengutronix.de,
 Michael Hennerich <michael.hennerich@analog.com>,
 Mudit Sharma <muditsharma.info@gmail.com>, linux-mediatek@lists.infradead.org,
 Andreas Klinger <ak@it-klinger.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 Leonard =?UTF-8?B?R8O2aHJz?= <l.goehrs@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org,
 Roan van Dijk <roan@protonic.nl>,
 =?UTF-8?B?Sm/Do28=?= Paulo =?UTF-8?B?R29uw6dhbHZl?= =?UTF-8?B?cw==?=
 <jpaulo.silvagoncalves@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 16/28] iio: imu: inv_icm42600: use = { }
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

On Wed, 11 Jun 2025 17:39:08 -0500
David Lechner <dlechner@baylibre.com> wrote:

> Use { } instead of memset() to zero-initialize stack memory to simplify
> the code.

This one isn't as obvious as many as the zeroing was in a loop
and now it's at declaration.

It's fine because we always copy over the same elements.

I'll leave this whole series a little longer in case we are missing
subtle cases like this. (but ones where it actually does make a difference!)

Jonathan


> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
>  drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c | 5 ++---
>  drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c  | 5 ++---
>  2 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c b/drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c
> index e6cd9dcb0687d19554e63a69dc60f065c58d70ee..dbd315ad3c4d2bd5085f7cd3cdc6de4391b1c896 100644
> --- a/drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c
> +++ b/drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c
> @@ -902,7 +902,8 @@ int inv_icm42600_accel_parse_fifo(struct iio_dev *indio_dev)
>  	const int8_t *temp;
>  	unsigned int odr;
>  	int64_t ts_val;
> -	struct inv_icm42600_accel_buffer buffer;
> +	/* buffer is copied to userspace, zeroing it to avoid any data leak */
> +	struct inv_icm42600_accel_buffer buffer = { };
>  
>  	/* parse all fifo packets */
>  	for (i = 0, no = 0; i < st->fifo.count; i += size, ++no) {
> @@ -921,8 +922,6 @@ int inv_icm42600_accel_parse_fifo(struct iio_dev *indio_dev)
>  			inv_sensors_timestamp_apply_odr(ts, st->fifo.period,
>  							st->fifo.nb.total, no);
>  
> -		/* buffer is copied to userspace, zeroing it to avoid any data leak */
> -		memset(&buffer, 0, sizeof(buffer));
>  		memcpy(&buffer.accel, accel, sizeof(buffer.accel));
>  		/* convert 8 bits FIFO temperature in high resolution format */
>  		buffer.temp = temp ? (*temp * 64) : 0;
> diff --git a/drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c b/drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c
> index b4d7ce1432a4f4d096599877040a89ede0625e0b..4058eca076d8b03a2290535eedffa0a74098d739 100644
> --- a/drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c
> +++ b/drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c
> @@ -806,7 +806,8 @@ int inv_icm42600_gyro_parse_fifo(struct iio_dev *indio_dev)
>  	const int8_t *temp;
>  	unsigned int odr;
>  	int64_t ts_val;
> -	struct inv_icm42600_gyro_buffer buffer;
> +	/* buffer is copied to userspace, zeroing it to avoid any data leak */
> +	struct inv_icm42600_gyro_buffer buffer = { };
>  
>  	/* parse all fifo packets */
>  	for (i = 0, no = 0; i < st->fifo.count; i += size, ++no) {
> @@ -825,8 +826,6 @@ int inv_icm42600_gyro_parse_fifo(struct iio_dev *indio_dev)
>  			inv_sensors_timestamp_apply_odr(ts, st->fifo.period,
>  							st->fifo.nb.total, no);
>  
> -		/* buffer is copied to userspace, zeroing it to avoid any data leak */
> -		memset(&buffer, 0, sizeof(buffer));
>  		memcpy(&buffer.gyro, gyro, sizeof(buffer.gyro));
>  		/* convert 8 bits FIFO temperature in high resolution format */
>  		buffer.temp = temp ? (*temp * 64) : 0;
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
