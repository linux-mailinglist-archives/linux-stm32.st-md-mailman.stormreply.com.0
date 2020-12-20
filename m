Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3512DF6FF
	for <lists+linux-stm32@lfdr.de>; Sun, 20 Dec 2020 23:11:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4370DC56611;
	Sun, 20 Dec 2020 22:11:24 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2692C32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Dec 2020 22:11:22 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id z9so5468342qtn.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Dec 2020 14:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iHUDQ1k2CkOqj9FzPxwhDlQR1OsVrOcQRdYUCJ3pKxI=;
 b=QoHtCfWS5mhOotpg0TOcdHlv84na7MJSw5iGrn18QYCCbzaRWuCSMCW42/Gp3vUEtA
 AM9i1lHs+unWJWbf4CVRpM+GvkvaJcRFUbzquGyNLe2K+oyMKQ6sh83F4J0GWE+LKl7u
 5rclWBWSkFiyH0spyiNYEZjSfUEx1KkLfMnfaJCnGCZ4GoLeMRX2cbWhbTcbSYAm0E7+
 wJpXVZRf+l4DxqkD+4qRLXmMWstMAUOV+/oAlzP6+YKqYsJd2k1z6S7TdfZKt0aicPui
 oaVwGaavuyugWEJzhMi3o9wCf1FpLEkZ1yJ7R/aslkOw1f2pDLqVPBKtdbCFpfGRGi+w
 xujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iHUDQ1k2CkOqj9FzPxwhDlQR1OsVrOcQRdYUCJ3pKxI=;
 b=TVAqY/IhHGHNC+aA5KfbP7TVxoghMnB+76SekxQrSNWjrYmrxgqAd9xSQeUYawfmRW
 x7I+yMeZmYZutwP69aHZ/CBWaSgZ+Qah+8RSHbZUScc7e4gMx6Ci0RVbIw60/kP6KBKa
 98gd+bER9s1Fwgcum5dBQ5TCQJXWD1x+fyet51gdqUtDLA0amD5IP8S9ohoXLG+PNXLX
 /LtX4aVNytyP7Ch7xYlOOZXUKIAKFhC5wXM+2dRmOLLpABugThxPT38kB+giGHMhzf6O
 3co6t8hLI3bglMmV4zJ9+oPWY59vy+UX/tMxq5nhJC52RrfXo+PdxK8j36ylBKJoa8Z5
 dnQA==
X-Gm-Message-State: AOAM530QIDipEziLCTl0GEtyjq0lF7nPWjGa87jTzDYTAUJnDsq8oVG5
 G+6+91ix6yo2YYeSYh3hV1Y=
X-Google-Smtp-Source: ABdhPJy/lhw8bdJnqAii5GkK9Ugrghmpb/5Yu9iidDmt2clYqF6tyGWtwr/nSSuIjmHP5GYBJqwZEA==
X-Received: by 2002:ac8:3987:: with SMTP id v7mr14022819qte.144.1608502281672; 
 Sun, 20 Dec 2020 14:11:21 -0800 (PST)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id 128sm4721459qki.26.2020.12.20.14.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Dec 2020 14:11:20 -0800 (PST)
Date: Sun, 20 Dec 2020 17:11:18 -0500
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: David Lechner <david@lechnology.com>
Message-ID: <X9/MBla990ctfpL4@shinobu>
References: <cover.1606075915.git.vilhelm.gray@gmail.com>
 <950660d49af7d12b09bc9d3b1db6f8ff74209c26.1606075915.git.vilhelm.gray@gmail.com>
 <9fe4090e-2780-31b8-8ffa-2c665c6a2a4e@lechnology.com>
MIME-Version: 1.0
In-Reply-To: <9fe4090e-2780-31b8-8ffa-2c665c6a2a4e@lechnology.com>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, mcoquelin.stm32@gmail.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 Dan Carpenter <dan.carpenter@oracle.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH v6 1/5] counter: Internalize sysfs
	interface code
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
Content-Type: multipart/mixed; boundary="===============3373608069073030713=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3373608069073030713==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uc5EkbJdgRcRyiTh"
Content-Disposition: inline


--uc5EkbJdgRcRyiTh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 13, 2020 at 05:15:00PM -0600, David Lechner wrote:
> On 11/22/20 2:29 PM, William Breathitt Gray wrote:
>=20
> >   14 files changed, 1806 insertions(+), 2546 deletions(-)
>=20
> It would be really nice if we could break this down into smaller
> pieces and start getting it merged. It is really tough to keep
> reviewing this much code in one patch over and over again.

Yes, this is a pretty massive patch. I could break this across the
individual files affected to make it simpler to review, but in the end
all those patches would need to end up squashed together before merge
again (for the sake of git bisect), so the effort feels somewhat moot.

Luckily, I don't think there will be much change in the next revision
since it's looking like it'll mainly be a few bug fixes; hopefully this
coming version 7 will be the final revision before merge.

> Here are some initial findings from testing:
>=20
>=20
> > +static void counter_device_release(struct device *dev)
> > +{
> > +	struct counter_device *const counter =3D dev_get_drvdata(dev);
> > +
> > +	counter_chrdev_remove(counter);
> > +	ida_simple_remove(&counter_ida, counter->id);
> > +}
>=20
>=20
> I got the following error after `modprobe -r ti-eqep`:
>=20
> [ 1186.045766] ------------[ cut here ]------------
> [ 1186.050647] WARNING: CPU: 0 PID: 2625 at lib/refcount.c:28 counter_dev=
ice_release+0x10/0x24 [counter]
> [ 1186.059976] refcount_t: underflow; use-after-free.
> [ 1186.064790] Modules linked in: aes_arm_bs(+) crypto_simd cryptd ccm us=
b_f_mass_storage usb_f_acm u_serial usb_f_ecm rfcomm usb_f_rndis u_ether li=
bcomposite aes_arm aes_generic cmac bnep wl18xx wlcore mac80211 libarc4 sha=
256_generic libsha256 sha256_arm cfg80211 ti_am335x_adc kfifo_buf omap_aes_=
driver omap_crypto omap_sham crypto_engine pm33xx ti_emif_sram hci_uart oma=
p_rng btbcm rng_core ti_eqep(-) counter bluetooth c_can_platform c_can ecdh=
_generic bmp280_spi ecc can_dev libaes bmp280_i2c bmp280 industrialio omap_=
mailbox musb_dsps wlcore_sdio musb_hdrc udc_core usbcore wkup_m3_ipc at24 o=
map_wdt phy_am335x watchdog phy_am335x_control ti_am335x_tscadc phy_generic=
 wkup_m3_rproc usb_common cppi41 rtc_omap leds_gpio led_class cpufreq_dt pw=
m_tiehrpwm autofs4
> [ 1186.132376] CPU: 0 PID: 2625 Comm: modprobe Not tainted 5.10.0-rc7bone=
-counter+ #23
> [ 1186.140070] Hardware name: Generic AM33XX (Flattened Device Tree)
> [ 1186.146225] [<c0110d70>] (unwind_backtrace) from [<c010b640>] (show_st=
ack+0x10/0x14)
> [ 1186.154017] [<c010b640>] (show_stack) from [<c09a0c98>] (dump_stack+0x=
c4/0xe4)
> [ 1186.161285] [<c09a0c98>] (dump_stack) from [<c0137ba0>] (__warn+0xd8/0=
x100)
> [ 1186.168284] [<c0137ba0>] (__warn) from [<c099c8e4>] (warn_slowpath_fmt=
+0x94/0xbc)
> [ 1186.175814] [<c099c8e4>] (warn_slowpath_fmt) from [<bf10b0e8>] (counte=
r_device_release+0x10/0x24 [counter])
> [ 1186.185632] [<bf10b0e8>] (counter_device_release [counter]) from [<c06=
67118>] (device_release+0x30/0xa4)
> [ 1186.195163] [<c0667118>] (device_release) from [<c057f73c>] (kobject_p=
ut+0x94/0x104)
> [ 1186.202944] [<c057f73c>] (kobject_put) from [<c057f73c>] (kobject_put+=
0x94/0x104)
> [ 1186.210472] [<c057f73c>] (kobject_put) from [<bf19004c>] (ti_eqep_remo=
ve+0x10/0x30 [ti_eqep])
> [ 1186.219047] [<bf19004c>] (ti_eqep_remove [ti_eqep]) from [<c066f390>] =
(platform_drv_remove+0x24/0x3c)
> [ 1186.228313] [<c066f390>] (platform_drv_remove) from [<c066d934>] (devi=
ce_release_driver_internal+0xfc/0x1d0)
> [ 1186.238187] [<c066d934>] (device_release_driver_internal) from [<c066d=
a78>] (driver_detach+0x58/0xa8)
> [ 1186.247456] [<c066da78>] (driver_detach) from [<c066c5ec>] (bus_remove=
_driver+0x4c/0xa0)
> [ 1186.255594] [<c066c5ec>] (bus_remove_driver) from [<c01dd150>] (sys_de=
lete_module+0x180/0x264)
> [ 1186.264250] [<c01dd150>] (sys_delete_module) from [<c0100080>] (ret_fa=
st_syscall+0x0/0x54)
> [ 1186.272551] Exception stack(0xd247ffa8 to 0xd247fff0)
> [ 1186.277629] ffa0:                   004fb478 004fb478 004fb4b4 0000080=
0 b3bfcf00 00000000
> [ 1186.285847] ffc0: 004fb478 004fb478 004fb478 00000081 00000000 be97490=
0 be974a55 004fb478
> [ 1186.294062] ffe0: 004f8f5c be97352c 004ddd97 b6d11d68
> [ 1186.299253] ---[ end trace e1c61dea091f1078 ]---

I noticed that I'm calling counter_chrdev_remove() twice: once in
counter_unregister(), and again in counter_device_release(). I suspect
this is what's causing the refcount to underflow. I'll test and verify
that this is the culprit.

In fact, I don't think I need to define a counter_device_release()
callback at all, would I? These cleanup function calls could be moved to
counter_unregister() instead.

> > +static ssize_t counter_comp_u8_store(struct device *dev,
> > +				     struct device_attribute *attr,
> > +				     const char *buf, size_t len)
> > +{
> > +	const struct counter_attribute *const a =3D to_counter_attribute(attr=
);
> > +	struct counter_device *const counter =3D dev_get_drvdata(dev);
> > +	struct counter_count *const count =3D a->parent;
> > +	struct counter_synapse *const synapse =3D a->comp.priv;
> > +	const struct counter_available *const avail =3D a->comp.priv;
> > +	int err;
> > +	bool bool_data;
> > +	int idx;
> > +	u8 data;
> > +
> > +	switch (a->comp.type) {
> > +	case COUNTER_COMP_BOOL:
> > +		err =3D kstrtobool(buf, &bool_data);
> > +		data =3D bool_data;
> > +		break;
> > +	case COUNTER_COMP_FUNCTION:
> > +		err =3D find_in_string_array(&data, count->functions_list,
> > +					   count->num_functions, buf,
> > +					   counter_function_str);
> > +		break;
> > +	case COUNTER_COMP_SYNAPSE_ACTION:
> > +		err =3D find_in_string_array(&data, synapse->actions_list,
> > +					   synapse->num_actions, buf,
> > +					   counter_synapse_action_str);
> > +		break;
> > +	case COUNTER_COMP_ENUM:
> > +		idx =3D __sysfs_match_string(avail->strs, avail->num_items, buf);
> > +		if (idx < 0)
> > +			return idx;
> > +		data =3D idx;
> > +		break;
> > +	case COUNTER_COMP_COUNT_MODE:
> > +		err =3D find_in_string_array(&data, avail->enums,
> > +					   avail->num_items, buf,
> > +					   counter_count_mode_str);
> > +		break;
> > +	default:
> > +		err =3D kstrtou8(buf, 0, &data);
> > +		break;
> > +	}
> > +	if (err)
>=20
> This needs to be `if (err < 0)`. There are cases where the functions
> above return positive values. (And to be overly safe, it probably wouldn't
> hurt to use err < 0 everywhere - not just in this function.)

Ack.

William Breathitt Gray

--uc5EkbJdgRcRyiTh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl/fzAYACgkQhvpINdm7
VJJiAg/9F1Dlf+iVCNclJFIuXxKcGqR+ojOXb8JSegF1H/8l6T+ffbp/gxhovPzD
86urwluDDgVTPr0tLP4gkiqJkPO7Iw2HjvaCJQGQ24M+LssVmjS/0fiQsQXzOBsv
PXeV+AtbeGdrwcf9FU/4XAyYZm2OneJZJMxGmhxsqvVAqQZB/QaTvzR7mr5DnMwH
O3M7IiGzNQ6OzINKGFmKHZiJr9OQmu1LE7c2PhZjn++aHXFgEDYtLqtvj/a3xqm3
Mu3kiIpJVVREnErvK6nHFLpSGyKiLpwqp8/XQ5KONmQs75qeqqoH7PSEDWm01zd4
3O1ZM6NDWfiyc7/fvE8YL4KT767Vfryb5mGA0IQ0xUgRTBds9jJAHZ/Iz53k0bwH
qOeD9festidjFF9+7ohEWMl//4VDVGajja1SwGp2pTvge0sHk5OUNHVG8l1DzGGd
Vk7CbfI3Rp7hggieSibJ4r4GdBPJ76NfcGg4CD2GUeZ9RLIowqvdiW/XdOK+EVji
6dgZpZ4EbdKgsUEceJBZUUfqvmaEdUD/LNNdWgKSbUZisYmAM+7z4buddEA4wFQ7
OXoc/J5Wl5wWQIEh5mgezMKfj0ohwqiTXL2WzvuSh0diEZaxp3mmjZknrvDkmSzJ
qh3TKz+uJ72IPZ4qL6CX3Y3Ra5x04ebLxJo0gzo1ed0KwbSMyfM=
=qN6v
-----END PGP SIGNATURE-----

--uc5EkbJdgRcRyiTh--

--===============3373608069073030713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3373608069073030713==--
