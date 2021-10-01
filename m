Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9657641E88C
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Oct 2021 09:48:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E8D3C5A4F8;
	Fri,  1 Oct 2021 07:48:29 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6C43C597BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Oct 2021 07:22:20 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id x27so35306345lfu.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 Oct 2021 00:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UZCnsoRR6tW1pSh/IupBZu9naoc4rbVQqcvJGsUgDM8=;
 b=HKGgvPjKlFCWLm7BRyC5cSgjT8DG5b9iXAkdPjGc/vSMDpB6q3emnZ7uOPH5/FRD+/
 Zk9D/JS5ROA52aISv5HViAzvpxnNJo+1fN2I8UB6RnKn6Th4pylfQUX4z60YwgO3EuBa
 QqoktQ9TresMl42XFcfEnxG+bXWP5BYe4pKyFVrj4LzqVxU8qMmpEVB7fTFQoJNbVNTJ
 l/j8djErJs+xs1vM2bhyO41t/QMog+2Sb3GX+90JNXUOqLackzR6GZrEM9jcjeSU5l/x
 dYSvWFdj50XEnyfMZCmTJb6gKStjvBRX0mutqJQXaoIWuQmsIuZGq62Ch2Ut5dk28gnB
 RmUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UZCnsoRR6tW1pSh/IupBZu9naoc4rbVQqcvJGsUgDM8=;
 b=pDGXzWobL3747i1qXCXWNSeJ112d6XW+KQtim7k4EFRk1cZEwAcwg4j9eZBuLTcv+z
 NUN0tfMd0W8uzasSdSTuDab62i7dgEZmlgS3O5gtDlFWWh4LNQ66bmMw3ufo/QxCfI0Y
 9aOdckMiF36UfSI4+U2DteBCtkCPybtRaWFppBFZMhAtdvFr6kIuveMJSGIdbgTsZp06
 DVLVBW3ztFe3MbMn4QyaWd0BKJcQDSySg0ZYW1n4wlHaVEw5GQqGcNKlQH07oMNbce4E
 wAq5B2iq4miG2b+U9TFu7UZVp5bulAnEZKv4JfnDv4MqBeZxlsX9l9WUP9sd4W86M9rF
 fjJQ==
X-Gm-Message-State: AOAM531hmr8Ovq8slaPpAj9L6bzgtAgJcir3+yy+k/JNV5pqDyhuIKCw
 P7ORGraJUzTQ+mub7z/ovN0=
X-Google-Smtp-Source: ABdhPJwvtum04dzFdOmyZug6tdJxz7a6DQk1UzdnIGCSZLXX+LPE5ovwTftul+8mAvi0Los0Xnu+qw==
X-Received: by 2002:a2e:95cc:: with SMTP id y12mr10476403ljh.337.1633072940119; 
 Fri, 01 Oct 2021 00:22:20 -0700 (PDT)
Received: from gmail.com (82-209-154-112.cust.bredband2.com. [82.209.154.112])
 by smtp.gmail.com with ESMTPSA id
 d27sm583764ljo.119.2021.10.01.00.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 00:22:19 -0700 (PDT)
Date: Fri, 1 Oct 2021 09:22:24 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Cai Huoqing <caihuoqing@baidu.com>
Message-ID: <YVa29EEA0QDOIYRz@gmail.com>
References: <20210928013902.1341-1-caihuoqing@baidu.com>
 <20210928013902.1341-3-caihuoqing@baidu.com>
MIME-Version: 1.0
In-Reply-To: <20210928013902.1341-3-caihuoqing@baidu.com>
X-Mailman-Approved-At: Fri, 01 Oct 2021 07:48:28 +0000
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 3/8] iio: dac: ltc1660: Make use of the
 helper function dev_err_probe()
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
Content-Type: multipart/mixed; boundary="===============8991126487205236651=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8991126487205236651==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jPhrg6tqow6ibvlc"
Content-Disposition: inline


--jPhrg6tqow6ibvlc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 28, 2021 at 09:38:56AM +0800, Cai Huoqing wrote:
> When possible use dev_err_probe help to properly deal with the
> PROBE_DEFER error, the benefit is that DEFER issue will be logged
> in the devices_deferred debugfs file.
> Using dev_err_probe() can reduce code size, and the error value
> gets printed.
>=20
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Reviewed-by: Marcus Folkesson <marcus.folkesson@gmail.com>

--jPhrg6tqow6ibvlc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmFWtysACgkQiIBOb1ld
UjJPlw/7BcTosUvT5m+Tec7d5bCXiVt6Sp7/scCFAbVVt/vOdsDQyirVVNalaAKk
+k55V9yI+zpOzdywX8XqerCXQoZxqHJMWRlKl980SZbBSTracjAgQsu5n3wrC/Fv
f5PgZS1SJFAn62xfFWAMBICxFVG0yKYBSHNOGjeWCKxUBUsKZ2sObI3/0cYpEOr/
syoeqoI5drSBTKUOeYsoQ9QX61S906K2dR896wZ3td96Vt6aDvk7qtLNcrMZWfPh
M3rQjBXIO1FedNr6BXcj52tzxTOke7aMRV6/vUeL4z4g4G3uvEfhP2SmdYy7uEnT
5nda00ezX3Pjr3P+NgiCl/Urvh6FT6OUJuE/e7H4Cz3hGTvIxMBrG//uC646IF0p
ndV/sAr246ODba6z5G7seWutG7+L+m8cOcC4tb6RNlaFsLchUaIS1ZF/WUR8jNd6
dhhwHPGEonJ5hpAwDvFew+Lhztp3eSMZwDnJJ0GPbWdr+UCqHNiQ7wneo5DAINgd
1YiG6BmT1y8ZQJYH9eCXLv5vZDZq7Xujbdk8YZFdJfvVLwCrfHVnGqcaxDf2gEkp
5o1h+WdrhFSVg4wjXUahVjo2fgNmwD68kz6U5OmP/2N0pVEIZMO6b6JiBb6LiGWz
my1pn3NRxGJ9OaAetWCrKolBli/8HGQTrlREha7utfzrPQuoPCE=
=XqrG
-----END PGP SIGNATURE-----

--jPhrg6tqow6ibvlc--

--===============8991126487205236651==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8991126487205236651==--
