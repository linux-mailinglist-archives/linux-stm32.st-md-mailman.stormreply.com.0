Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 673DF2917F1
	for <lists+linux-stm32@lfdr.de>; Sun, 18 Oct 2020 16:50:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31309C3FAE3;
	Sun, 18 Oct 2020 14:50:34 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86B6CC3FAD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Oct 2020 14:50:32 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id i22so5955753qkn.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Oct 2020 07:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SAR/XwyrV6/GhmfSQONbkaQBYVb9H0s6Kue9beJBth4=;
 b=JTI2e5NAUd29QUk7IAO/UujFkW7VqQUT/vAvWxpuKmwxz9QQWfeEreCx6Zh4dz6Tr8
 IO91zoDvhoUooCbNxqcSEEoLCMPKQUKOM0bON1SBHoK7TQvzniBjAPYq3/kSAg/Ccy59
 7xtet0KPqZPk6qmuItKvRKc+qdkvQnZlWA9HwsOraTd1f9AJRJ6qoAqHMrU0Tz7GOkyp
 qkxYz4E9FXFeoME1aY1wglsMSh6Pp3BhH8KKUX+BIRcSxTvYz6R5W5QWh+RDon+1r7oM
 XaR1PZMATSGO7mWRGmoVcT1ROk9Rl1qAdwjxBL6eO1escGCdaaT+t/S/TDFGqq79OJNL
 +leQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SAR/XwyrV6/GhmfSQONbkaQBYVb9H0s6Kue9beJBth4=;
 b=kFKAMrYKuxhGrlGFwpXbDLNfNhfTYqpd3MtS7kaJwb+38v+/2rk/JarpcBrzK8mfrI
 ISVkdbFB408pWg+u2LGU8HECPbuWCy+0tbso9msKH7jN59/MAMr5j54wbWeY9ITeye0n
 O6/qvHkFVV1vx5BysJ6G3xytOlHQb5hc+MSQmRA/NAOr5mxJWL45m5PB1vOyiqT104sr
 6VnNMDTck/ZQzCH3sf4oRUEYLGRMpIvLKADc1GY3bauRGanXEFhylPDwgei9JmZSqZuy
 yoefLKGmlFUAnG+ryRrb7cgX/+HSldQGEt/jllXg9931Qd+wB0PwZBDQ/4HY9ekDQZ9O
 5w/w==
X-Gm-Message-State: AOAM531kACwRSdvnye1RLnnryUMzLYUWfpPnqD4DCA4tv27lRnAR+a9o
 bnJGbUKCqf9Nrx9+JD97Txs=
X-Google-Smtp-Source: ABdhPJzrSY4sikkyntHRR72cF6xgM2PD32fOeKkMij2G1c4qQN3ccKlatHl+iLzl5vh5vkcodawv6g==
X-Received: by 2002:a37:2c03:: with SMTP id s3mr10548074qkh.91.1603032630993; 
 Sun, 18 Oct 2020 07:50:30 -0700 (PDT)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id w6sm3230710qkb.6.2020.10.18.07.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2020 07:50:30 -0700 (PDT)
Date: Sun, 18 Oct 2020 10:50:25 -0400
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: David Lechner <david@lechnology.com>
Message-ID: <20201018145025.GC231549@shinobu>
References: <cover.1601170670.git.vilhelm.gray@gmail.com>
 <7a829fe8cba3ae222796328f832bd2546769e6ac.1601170670.git.vilhelm.gray@gmail.com>
 <a0e54a35-eed6-a938-dd4e-4f602d3b50c0@lechnology.com>
MIME-Version: 1.0
In-Reply-To: <a0e54a35-eed6-a938-dd4e-4f602d3b50c0@lechnology.com>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com, alexandre.belloni@bootlin.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 5/5] counter: 104-quad-8: Add IRQ
 support for the ACCES 104-QUAD-8
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
Content-Type: multipart/mixed; boundary="===============7767281991450715034=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7767281991450715034==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UPT3ojh+0CqEDtpF"
Content-Disposition: inline


--UPT3ojh+0CqEDtpF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2020 at 07:13:32PM -0500, David Lechner wrote:
> On 9/26/20 9:18 PM, William Breathitt Gray wrote:
> > +static irqreturn_t quad8_irq_handler(int irq, void *quad8iio)
> > +{
> > +	struct quad8_iio *const priv =3D quad8iio;
> > +	const unsigned long base =3D priv->base;
> > +	unsigned long irq_status;
> > +	unsigned long channel;
> > +	u8 event;
> > +	int err;
> > +
> > +	irq_status =3D inb(base + QUAD8_REG_INTERRUPT_STATUS);
> > +	if (!irq_status)
> > +		return IRQ_NONE;
> > +
> > +	for_each_set_bit(channel, &irq_status, QUAD8_NUM_COUNTERS) {
> > +		switch (priv->irq_trigger[channel]) {
> > +		case 0:
> > +			event =3D COUNTER_EVENT_OVERFLOW;
> > +				break;
> > +		case 1:
> > +			event =3D COUNTER_EVENT_THRESHOLD;
> > +				break;
> > +		case 2:
> > +			event =3D COUNTER_EVENT_OVERFLOW_UNDERFLOW;
> > +				break;
> > +		case 3:
> > +			event =3D COUNTER_EVENT_INDEX;
> > +				break;
> > +		default:
> > +			/* We should never reach here */
> > +			return -EINVAL;
>=20
> This is not a valid return value for an IRQ handler. Maybe WARN_ONCE inst=
ead?

Ack.

> > +		}
> > +		err =3D counter_push_event(&priv->counter, event, channel);
> > +		if (err)
> > +			return err;
>=20
> Same here. Otherwise, I think we could end up with interrupts in an endle=
ss
> loop since the interrupt would never be cleared.

Good point, I'll change this and the one above.

William Breathitt Gray

> > +	}
> > +
> > +	/* Clear pending interrupts on device */
> > +	outb(QUAD8_CHAN_OP_ENABLE_INTERRUPT_FUNC, base + QUAD8_REG_CHAN_OP);
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
>=20

--UPT3ojh+0CqEDtpF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl+MVjEACgkQhvpINdm7
VJJ/2g/9H84UNACWIgJbKmcgPdOuv42qHwZ0jla3LA3Sa/Le+jjyRPXhlC0po31D
Q02H/GXunXfanDa3dRcI+4wKobRonBxnD4qvQcv9PMY4KWIxiqRUzIToz6PG4Frl
U1lod6lMw7tmTBAov69D+faZv7q46UiuJ4fNpZjzhgy+Ut78SsR5x/FSM8W+y2Xe
VeWYX3MPk7xrVMDdwFZN8x8lCKUgwlDBIPgLW9SoGaoqJfXSa4EZejluUo8jztlz
yehC6XuGu0gkIvfWq2PTqAX8wciFoxv1xHZ0+4Rgyw+7qW3sXFT+rWGygxiyxAe6
qr1DJ9r9JkSLTNYuMkdn2g6jhoH98mrkSbhi5uwf34H5At874zqFI3tcgG8s05fO
drKQeA1WjVDp7TaEF1OfXfqKkuiKL0+YUB6fxQpZ53KvT2tRSSl/9A7z/JCkGyKX
8pSntpr1rI9ZR9dxzk6nblOoZX7KYO1K4hZ0Eby1E3YI/y7IrzAADYuB2t0MzVfn
qQMXT8LzKtaE/pIQk9IfnOevFFKhfchknxxtXW4I0ak6RlKuo7Ai7IPUeuQvukEK
pM63pZ41G5Y6uzefTecb+kg33cVMC2shKU2hRJYzL0o5z2CcQUAyCKuFuBM1k4LX
sxYRf3wetepvzBMF6YUzCpcR8fBQP/kuVR3PYd5sche8IpphpK0=
=xuQj
-----END PGP SIGNATURE-----

--UPT3ojh+0CqEDtpF--

--===============7767281991450715034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7767281991450715034==--
