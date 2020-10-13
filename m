Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC0D28D475
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Oct 2020 21:28:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BBA9C3FADE;
	Tue, 13 Oct 2020 19:28:05 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3081CC36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Oct 2020 19:28:04 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id y198so846537qka.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Oct 2020 12:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oH57Aeq7dptpbLJ/Gi2x/xQv7Jn157z+tldkFDsNdQM=;
 b=pNlUsnGhf+deEhFYlFqDY5WR8rb2vOVydQDO8QwSvlS/iLxpD14Hx6AIEABIJxLn0c
 M8s9QGsCktIrZqTduAtjIjKlMWJ7DKouhiwdMZs9Tq1+k1NTgNXXmZB3Zexh2vYaBBlA
 MdsUKxFeSS49DaklCfpQ4PrS66PXsjjGLTEj9JtwZJekjrFh2isHrbeYYNMlDVKl5sHK
 NJ8xe3e5HbVuM9HyevTdl5om3GHXHRPKoqxYSwgQiDQ7EodoRy4KuWDKkq5TTOEggl28
 o10R2OX93CMdmOUws6qi01Iperaqf3lNGaFy2BekOstQ9pb/AN9ye587q0yDa3eZS9+w
 /Unw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oH57Aeq7dptpbLJ/Gi2x/xQv7Jn157z+tldkFDsNdQM=;
 b=RYLNQRJmi3WWfa1nNWyWd12u2O3iLVEgQfJK5GDxhF6/e89RqBkiOGNP50bXGFbLld
 T5nwqePagVSPYyUsuPt8Y5FX9h6DfPCTyD/MZNoGd1c8rUtpNDPj2Asrj6Zqz96ENc5m
 o8kh6CwlgYAAYR+2em57GHLSzuvBfRP9ZLiFEJUDziOHjjFyBl48UZaWtSeZH9YT2xIZ
 OjjFkxBlsHj7oCVo9x2zoU/WT7dbxeNA8OaaQQghmfQenZ/Od/4NvuRZo+wUFEVoexkh
 8BxSdP/CqFM9S7GD6s5tgCWitTPEQ4S2D6NOjsBbfrhP8YZrh9R4xibmwv25vhAx5+ay
 kLAg==
X-Gm-Message-State: AOAM53396O0q+H5Sgt3C/gW2ptwqPS8Gfx98XErLdyGDr+HK4TNSeF/3
 mk14NDDBE5GqWTkXXxl22XA=
X-Google-Smtp-Source: ABdhPJx3RWQ0Ixnkg8H7A0PimPYFPhuFdry/B79ZtoiOA/CSvk9rCJEEn5yfbDMQoseSWKFJdfADhA==
X-Received: by 2002:a37:a8a:: with SMTP id 132mr1582931qkk.199.1602617282945; 
 Tue, 13 Oct 2020 12:28:02 -0700 (PDT)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id s17sm337542qta.26.2020.10.13.12.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 12:28:02 -0700 (PDT)
Date: Tue, 13 Oct 2020 15:27:43 -0400
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: David Lechner <david@lechnology.com>
Message-ID: <20201013192743.GA33437@shinobu>
References: <cover.1601170670.git.vilhelm.gray@gmail.com>
 <54190f9875b81b6aa5483a7710b084053a44abb8.1601170670.git.vilhelm.gray@gmail.com>
 <20201008080909.GA31561@amd> <20201008122845.GA3314@shinobu>
 <d06d5e47-5776-85ee-0dc5-8b624e36d83d@lechnology.com>
 <20201013185851.GB32722@shinobu>
 <09949c56-19da-1937-418b-99a1a9260c4c@lechnology.com>
MIME-Version: 1.0
In-Reply-To: <09949c56-19da-1937-418b-99a1a9260c4c@lechnology.com>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, mcoquelin.stm32@gmail.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Pavel Machek <pavel@ucw.cz>,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 4/5] docs: counter: Document character
	device interface
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
Content-Type: multipart/mixed; boundary="===============6380495556589239088=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6380495556589239088==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2020 at 02:08:45PM -0500, David Lechner wrote:
> On 10/13/20 1:58 PM, William Breathitt Gray wrote:
> > On Mon, Oct 12, 2020 at 12:04:10PM -0500, David Lechner wrote:
> >> On 10/8/20 7:28 AM, William Breathitt Gray wrote:
> >>> On Thu, Oct 08, 2020 at 10:09:09AM +0200, Pavel Machek wrote:
> >>>> Hi!
> >>>>
> >>>>> +        int main(void)
> >>>>> +        {
> >>>>> +                struct pollfd pfd =3D { .events =3D POLLIN };
> >>>>> +                struct counter_event event_data[2];
> >>>>> +
> >>>>> +                pfd.fd =3D open("/dev/counter0", O_RDWR);
> >>>>> +
> >>>>> +                ioctl(pfd.fd, COUNTER_SET_WATCH_IOCTL, watches);
> >>>>> +                ioctl(pfd.fd, COUNTER_SET_WATCH_IOCTL, watches + 1=
);
> >>>>> +                ioctl(pfd.fd, COUNTER_LOAD_WATCHES_IOCTL);
> >>>>> +
> >>>>> +                for (;;) {
> >>>>> +                        poll(&pfd, 1, -1);
> >>>>
> >>>> Why do poll, when you are doing blocking read?
> >>>>
> >>>>> +                        read(pfd.fd, event_data,  sizeof(event_dat=
a));
> >>>>
> >>>> Does your new chrdev always guarantee returning complete buffer?
> >>>>
> >>>> If so, should it behave like that?
> >>>>
> >>>> Best regards,
> >>>> 									Pavel
> >>>> --=20
> >>>> (english) http://www.livejournal.com/~pavelmachek
> >>>> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/hor=
ses/blog.html
> >>>
> >>> I suppose you're right: a poll() should be redundant now with this
> >>> version of the character device implementation because buffers will
> >>> always return complete; so a blocking read() should achieve the same
> >>> behavior that a poll() with read() would.
> >>>
> >>> I'll give some more time for additional feedback to come in for this
> >>> version of the patchset, and then likely remove support for poll() in
> >>> the v6 submission.
> >>>
> >>> William Breathitt Gray
> >>>
> >>
> >> I hope that you mean that you will just remove it from the example
> >> and not from the chardev. Otherwise it won't be possible to
> >> integrate this with an event loop.
> >=20
> > Would you elaborate a bit further on this? My thought process is that
> > because users must set the Counter Events they want to watch, and only
> > those Counter Events show up in the character device node, a blocking
> > read() would effectively behave the same as poll() with read(); if none
> > of the Counter Events occur, the read() just blocks until one does, thus
> > making the use of a poll() call redundant.
> >=20
> > William Breathitt Gray
> >=20
>=20
> If the counter device was the only file descriptor being read, then yes
> it wouldn't matter. But if we are using this in combination with other
> file descriptors, then it is common to poll all of the file descriptors
> using a single syscall to see which one is ready to read rather than
> doing a non-blocking read on all of the file descriptors, which would
> result in many unnecessary syscalls.

Ah, that's a fair point, my original view was somewhat myopic there.
I'll leave poll support in the Counter chrdev then and just simplify the
documentation example code to not use it.

William Breathitt Gray

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl+F/68ACgkQhvpINdm7
VJL09xAAiV4IcrugWkrx2BL3YYZnD8T2DIOs7rpSZAQhOmnCdYi+RkdpcIkL1BiE
m43MgXUDtj+YsRzAVE55mySXUbpDXH3Hp2/ty0p8tzToy+ZI6d2ooRzFwNsxlSdy
4/FIQQQaqCpl6pBBwRwsum2Swe7JrToX+Q+FoN7KZt1STia8FuxlmiWlUC+ZL6L6
rk4/3dMMLcCm8JKGZ4qKqSEJxXyHGKQ/leAm9GTRS4a+RjzNiidBvM4+aNuAy+bC
j7x7vzHHfmxT1egmhT4XeyyuWW8C4rd1mQXG8RllaP6PhABi61Zd+KH1LIfMjV1P
t/9biiBXbdyh5uytVrI6Z04tu0frQGZi1JglSLljGvkNoKRBnvP8f9ay44y2PrG7
jAYAq0lgig9N0zLNql9c/ZMtanGACNlxQShnO/5MjYo1oBjXPy9I8oOn4vI5OvnG
2ccm6NhZRs+bU5f0dRJZy+DsqQFWaekjXVxmqu/HwG45YbcxUpprSY0qZtbLOe1m
U2EuuipT10o/UoJMO+3AlqqgJOfj2cGL2lXMIMSUFb3HQ0TDuHbBq3GPG02Fn9qL
TYHt5XoeQWb82gOmVuL0ynXac8mXuGy9PwGrHBYQryfODVvy6kA3nhSXkFncb52q
ovI9PDQc8Z3jigrxj17nrlvoDNb6FT+2knKdwSujiKgo8ZWdZUc=
=4Gc4
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--

--===============6380495556589239088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6380495556589239088==--
