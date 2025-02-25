Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB78CA44DEA
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 21:44:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9EE7CC7A824;
	Tue, 25 Feb 2025 20:44:01 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D88BC7A822
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 20:44:00 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-38f325dd9e6so3190949f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 12:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740516240; x=1741121040;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=km6GgyUtBYWlPDyGMWfcUJBELXq839o82rzSdqdT8ck=;
 b=LHWTmka0F/TWkH9eWPsWREDtPelO6PZxGq/p6WKP/Bs0ySNEB2IISFvaBu5nhsMJx9
 206Z1xpIWQa+zTdWRdZKORO99y9B3gLaG4D1sRcymkl+OJ+woZfIXiNhTXfYaE1g3aih
 TRVL3UCBzMI6lLiXktX6LenwzwqlCSiWW5goiibAT9ymCXMGJYjHI3oCriCf1WhP1TV0
 8al4p0TWgFcGQWF6NYvq/Nb4lgf6D0rRKEIamtJzHKmtSrrTv64WqbgtJoeMBOw7jGRj
 gSLW1+es1WnUyDco9x/Gsv/WHpY5v3AsryY5qe7DQrU45ffLXw/UusOczClsOdPv5Mm3
 rDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740516240; x=1741121040;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=km6GgyUtBYWlPDyGMWfcUJBELXq839o82rzSdqdT8ck=;
 b=Ks1EaAl3+FPmCMbLobGaCTfb9M1Kx6orAHzNckIz2lzczjp5PUf0cICiNVf4pLlmZd
 f2Q1h+UuAGtHJvhEOASRsLrInnaad2u4FLtesIw32RHDZGjIv8HCNGyyglRmRWCchweS
 JfjlDGfdAIemTaM/Apk/auLIinuMkampGjsXtvXH5pxyVWKuCMTScjRGKZC6JY8mNALA
 dxYHSKOFhuUNts3YyKPkX4R3/D+enKWht4m/QCNpKfbIwhJstQ8mqwS6guXatQ1R+q1X
 MsIhR09GQi1a1IWqNQYYSUxtkZArQCuFFZNIStFFw+6J3NKQM/WnMLXq4igk3oB6VnB6
 4/ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtiYur1NknGq7g8KFuziufvBjoNg168Aav/6FVPHke1MWlo13Kc3nqEYoz2nDWxXbjKpKB+0lRwePzBA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy2OpxLHxq3Q0jDMbLqEjnb7W6yB2kE+wI8UQgea31lBiEWMYeO
 HXlyjK2GNBrdXs+sZQsyGdcOUqby4x4Wm/Tthl2BAfWVG911K8aN
X-Gm-Gg: ASbGnctzVKXnyod8//Th/DuWTKAcBbDMuv2MLywdRQngXO6hKwC9kIV6DjAX+9RdG3u
 cGlOATUVJrlFSsQtYHFQS2jpK6mVQfYZLKofdnCsdGuD7vvwFqi8oqOBCI0M4NYLTbHMFeHAbG/
 1HicBFCvkHiI3TCaGYBZkFpdwMINbo22j/GZFHQB1fZ0v1/+bQYEUDgH1iQ53sF5zms5nJ15eEw
 RJn9mL+CVEOLShrXcGMfLo+dLD9Sew9ht668FOKkFVpZ1AxqQUUWV7+Jmk/ZoWiOhcb/yDRyHeU
 gFKI+5J1c8p1tzOjzpMCL1j6VsIHgzxNzNLzfh0EaW4wMbH7IyS8zIBtfCjb6zQw6haJDB9Zw2X
 OsAj+w5/HXIBf
X-Google-Smtp-Source: AGHT+IFn60vNyjvN8suXWrn3N7MNMCvoYB7tyLvf0VIb/vaa4GNGBrrZf3vgpHtm6zuKbQT61XRnPw==
X-Received: by 2002:a5d:64e9:0:b0:38b:f4dc:4483 with SMTP id
 ffacd0b85a97d-390d4f421e7mr518360f8f.29.1740516239496; 
 Tue, 25 Feb 2025 12:43:59 -0800 (PST)
Received: from orome (p200300e41f187700f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f18:7700:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd86ce49sm3473823f8f.36.2025.02.25.12.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 12:43:58 -0800 (PST)
Date: Tue, 25 Feb 2025 21:43:56 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <x56yik7opvpr3o5vjlxoxzxdicrz2pimsh4lkpxol7c64r6irs@t7dfqy7ybn2a>
References: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
 <E1tkLZ6-004RZO-0H@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
In-Reply-To: <E1tkLZ6-004RZO-0H@rmk-PC.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, NXP S32 Linux Team <s32@nxp.com>,
 Emil Renner Berthing <kernel@esmil.dk>, imx@lists.linux.dev,
 Eric Dumazet <edumazet@google.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jon Hunter <jonathanh@nvidia.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jan Petrous <jan.petrous@oss.nxp.com>,
 Minda Chen <minda.chen@starfivetech.com>, linux-arm-kernel@lists.infradead.org,
 Thierry Reding <treding@nvidia.com>, Inochi Amaoto <inochiama@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 5/7] net: stmmac: s32: use
 generic stmmac_set_clk_tx_rate()
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
Content-Type: multipart/mixed; boundary="===============1802101794998997037=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1802101794998997037==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ofk7odbwikmdng6s"
Content-Disposition: inline


--ofk7odbwikmdng6s
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC net-next 5/7] net: stmmac: s32: use generic
 stmmac_set_clk_tx_rate()
MIME-Version: 1.0

On Tue, Feb 18, 2025 at 11:15:00AM +0000, Russell King (Oracle) wrote:
> Use the generic stmmac_set_clk_tx_rate() to configure the MAC transmit
> clock.
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

I wonder if the clk_set_rate() call for gmac->tx_clk could also be
removed from s32_gmac_init(). Comparing to the other drivers that
doesn't seem to be relevant since ->set_clk_tx_rate() will be called
anyway when the interface is brought up.

But it might be more difficult because somebody would actually have to
go and test this, whereas this patch here is the equivalent of the
previous code, so:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--ofk7odbwikmdng6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAme+K4wACgkQ3SOs138+
s6G4pQ/9HAe8mzGeYLufQVT2wUZVpeDW6XeOv6EOFIvwsgTf+44yqDw3xiulERM5
tTs3b8w6d4j3xO1PLdXoIlx3vANG5xRtGEcxXY3sB8HjmuSGWWig1zuSTAOJegbs
we7h3FfZwYlMaSJAfvQNZsX/rDN/auA0R8opcByCxOqFAqRwwJSEH+avYvvVgKEZ
Mmzov1YSzCyzB0pEEsAkdaB07XMdwl6Ee+ShlKaXzk88WS8KhxZKhYHWNFaAmqLo
1jyGoa08Vz/Y1WMhLPLCMPrjmWjrMcVjhjCNp9xmCffiJHDAec+eRfV41Cwmp6HC
wjh85xTUS/4hGh+Md5EWO8bxv9aTGHOkGwI4qVxl6xZVFJRkwZkAgrO4teY2RXy1
/flh/cJcM9x88N9LAemunvF+RuPBv5mHV8VWgnJW2a91p7hWKZWV2gxcbzEL4L8p
oKBcQDleR7I9gCunuLnQRiQlwSyw4oKX/96IQ86Dbr8th4/4pKsWtxfDPjHtqzo0
XzbRtT+vlLIFlTprG9nh5PLO/Lxs9OzJ0kiqhJh24nAwMNxbXS/msQ+m8PRWT3C/
/okF5ojWT+0ZijDIGhWi5uwBNWxiwav1tElTfJGEHIyz2qOiFZyFhUH7oi5E9iB4
rin6SAkxYbIF5XDT+zuqAifn/g0BNDr2moVdUvgImYtAMQUCLmo=
=c/GH
-----END PGP SIGNATURE-----

--ofk7odbwikmdng6s--

--===============1802101794998997037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1802101794998997037==--
