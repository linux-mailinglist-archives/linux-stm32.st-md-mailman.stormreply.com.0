Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE758815A7
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Mar 2024 17:30:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DC2DC6DD60;
	Wed, 20 Mar 2024 16:30:07 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 673F1C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Mar 2024 13:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710941006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+6oNZYA5370c4KGWdEFU65Z5mlYdjZGRdbPpGQE3sDk=;
 b=X/pccOB1EPp8hjvmYuQWUk4FscRf8V/OrqSjVXTVfqNFjFE5zo1kJrYEpgYQKYJ23oDxs9
 SKg0B/ebqdFay+6zEkPMpcMu1CuFzKMb6iKs8xXxF+h+mWMnBpp3/fnxznySwXhwVh32i/
 3eGQSak9gMA8+svwKpMbyQl4qhKzmfY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-KT-OgGHUMcufmf37lJen7A-1; Wed, 20 Mar 2024 09:23:24 -0400
X-MC-Unique: KT-OgGHUMcufmf37lJen7A-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-41464672d85so10765845e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Mar 2024 06:23:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710941003; x=1711545803;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+6oNZYA5370c4KGWdEFU65Z5mlYdjZGRdbPpGQE3sDk=;
 b=haUQeYRtnS4dRqvB+esqYYXaUpjHwpH7JGGq05Krm4+lqywkz9CGXn+70x5zHEuc0y
 AJC8Gd4flssant9OLx+mEfOnhs12Tx1kUDxNiWo28TZNRIwYCT3nYxl7jMoDIx3QjW1b
 PUKliYBJcLIRiQFjlSmPOJoZvAhcZy8VxJYEMIF6XSI2l0GDQLiiqhH0hj9D2dGmII5C
 wDdrXDRc6lQR0jVnz8TvmsK9hvrqJD/BEbvcUagjwd2HmoKFXHeflsixluCi+qHhfdCA
 hEjtCebNEwRM2eLIsBKBaLVxTpj64i4dj6kU/MkctWtzGAP0cpcQKJKqQkcBtXtbaCsh
 fxSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4cZhajybep7cDlradscNomA9B4BcYt5YKqc2xahPOLTi1a9sU+JqXHB92YWDXODRoU21aH/EQNqBnP+xp/G+eWrn+FX1XidIkiIdeNQctGzK3vKjEB4rY
X-Gm-Message-State: AOJu0YwDRSNveGsST3oTjfRUHa8y8y1XzhkZWnSXQr7fREaF4j7rlqBd
 mTKZvdz4B7FFxjy11vlXdsrBJ+QFxdnWYVXPNRhZ1WTxfAEPwatuQ/GMPUsB/H2LjHzVHMOxcrc
 lWvEdw6wSl+14EiLOta+Yl8mVHQdL3ADrPKp+6M7cyyKdMc+V8zTekAWIQb7UWcrdVii5xSb6Gw
 88QQ==
X-Received: by 2002:a05:600c:444e:b0:414:a36:f17e with SMTP id
 v14-20020a05600c444e00b004140a36f17emr8419025wmn.33.1710941003243; 
 Wed, 20 Mar 2024 06:23:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnoxc0ItU0VE0xCtc8nDq/jmLFXMQSF8hgS5etI1kpbKJ1cmWEac3cSUTlK7nXzeoWHCLVmQ==
X-Received: by 2002:a05:600c:444e:b0:414:a36:f17e with SMTP id
 v14-20020a05600c444e00b004140a36f17emr8418997wmn.33.1710941002743; 
 Wed, 20 Mar 2024 06:23:22 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 n21-20020a05600c4f9500b0041468961233sm2213163wmq.35.2024.03.20.06.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Mar 2024 06:23:22 -0700 (PDT)
Date: Wed, 20 Mar 2024 14:23:21 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Sean Nyekjaer <sean@geanix.com>
Message-ID: <20240320-berserk-soft-crab-70d22c@houat>
References: <4A53A669-C3AF-4D29-B5A5-0F7FEBA79045@geanix.com>
MIME-Version: 1.0
In-Reply-To: <4A53A669-C3AF-4D29-B5A5-0F7FEBA79045@geanix.com>
X-Mailman-Approved-At: Wed, 20 Mar 2024 16:30:05 +0000
Cc: Martin =?utf-8?Q?Hundeb=C3=B8ll?= <martin@geanix.com>,
 yannick.fertre@foss.st.com, dri-devel@lists.freedesktop.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] STM32 DSI controller driver: mode_valid clock
	tolerance
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
Content-Type: multipart/mixed; boundary="===============5613831547878728925=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5613831547878728925==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c2uo4eciowtywp47"
Content-Disposition: inline


--c2uo4eciowtywp47
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sean,

On Fri, Mar 08, 2024 at 09:35:27AM +0100, Sean Nyekjaer wrote:
> I=E2=80=99m using a stm32mp157 with a sn65dsi83 DSI2LVDS bridge. The LVDS
> display is having a minimum clock of 25.2 MHz, typical of 27,2 MHz and
> a max of 30,5 MHz.
>=20
> I will fail the mode_valid check with MODE_CLOCK_RANGE. It will
> request 27200000 Hz, but is getting 27250000. Guess the display is
> fine with this :)
>=20
> In this case it seems a bit harsh to fail if the output clock isn=E2=80=
=99t
> within 50 Hz of the requested clock.

Even for HDMI, the tolerance is usually .5% of the pixel clock. 50Hz
seems overly restrictive.

> If HDMI is requiring a tolerance of 50 Hz, would it be better to do
> the check in the HDMI bridge driver?

Judging from the code, it would be hard to do because the clock that
generates the pixel clock isn't exposed to the HDMI bridge.

Maxime

--c2uo4eciowtywp47
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZfrjSQAKCRDj7w1vZxhR
xaeXAP4v7eTw/+9FwH0Cc4hF7TRC1YdDLxTVnPdqi2UgyGFgtwD/UbIEzvYapnzD
+6fCskDtHvvfS5FCgUp9Hwsq1lfG3wM=
=OBMH
-----END PGP SIGNATURE-----

--c2uo4eciowtywp47--


--===============5613831547878728925==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5613831547878728925==--

