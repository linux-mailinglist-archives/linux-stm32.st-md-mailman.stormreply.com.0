Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED369E3BD8
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Dec 2024 14:57:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15385C71292;
	Wed,  4 Dec 2024 13:57:27 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D544CC7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Dec 2024 13:57:25 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-434a044dce2so83179605e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Dec 2024 05:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733320645; x=1733925445;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XC2czeLIMR1ljMUddmL8ssFZF/jsYoIl4rjVYGqN4Ys=;
 b=CliHF5LVdrGlS7FM4dXUTabtUjZDWoWyMxmK7dweBmWbTmQxLtYjogj6xzwBWHlMmy
 SQR8usZqA7ysJPE/rtw/BBQiwZf9B0yrqJxp1m9T/WsDcBbM7NI6WDP1HvW4I6ZYHMfG
 /yoL9WweqzyRYWa1igqkKldZcOZia+x1OdurdKEJ2+gn1u+IaXkCE6JWERuSQRTxzMCw
 zrv2983nwxoMwbPpECeGA/Gc0x8zF80DmoZmlNr9RP3K5vQ17awLFcd2y+bRQWBy+2c/
 Z60lKwjBo95BX2Cfti3aC7y3a378abmq2ijexDOdSBOofn/Xzf0DGF9e0bokuPDmY+NN
 b+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733320645; x=1733925445;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XC2czeLIMR1ljMUddmL8ssFZF/jsYoIl4rjVYGqN4Ys=;
 b=kkeIGfFIOpv0oWtv4NurnI90E/0B9XojhkCnnAvl4qIHMsZsgUcyr9zZI4lREf6svY
 P8JJi8ZV8k8DS+vM1rJCHZS/lQJNrQKynr7mnl0EsiKLN0yuolGPfMv7YFTZqGccAGgw
 6iWBNrnQgE8Nz31ucjBbkRFYOJiJ9xFEjKL6/AX/cRzIH3IyVcwFcXJFr9/b8qJEWxr0
 LhnI9J01Avc4WqEPcvgk4T1Lnt6dyTKgmPtjjTcHI2j/DuCj+nkqfiIS+w9lRJfXoIME
 D9PdEFn4Hav4JcQMAmywnC1bjP6F70KVm00lq4xAF9VhnNTN8sG+1yuhmObGTaZpfWSz
 HPzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyen2ZmVVBJIUw6ahykKPNTTk62r31ouUzTGMWzWnpfRN5uB55qBBIyAxbaecGGDK4aXDg+YfMltksUg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzmjdOXjsgjgHdmYfcLRagx9eIcuI9AVgqFt7ogs4QPuYTn38pi
 tpCqpBmWMb5ywN4+WULo7+2PrhjHcRzEljeLvj4RgtHzNbwcjhtJ
X-Gm-Gg: ASbGncs9DsDmqmi92n3SdqlqxsmCA9BGQ7+RKsIWzQixAX8m4B7UTuInc+Osowc50mv
 nq8xRvZagrOLTKICWnP5sq4KKVyoNVn1AYblBYm+g2MUP7zW3I+3TwcvnHSjnEvpmpLCdjy7Frw
 hrTzMqkZZkzGxGoqrPcXYlG/cppXBm5kP8f+3RTljjwHDCQ7Qr3DJriwRt0nmULT3n2v8+SOC4h
 0sm5tGIMl6FiM9w7jT9jhxU5wiP49KmOm/U8fV5EuuFI5wB5EajUcLe0mSyRK9wNyekOQN3Umk2
 piRxU8RBjBkgmBGR1iYDaRXnmvZd4XYn883W
X-Google-Smtp-Source: AGHT+IESrS7F5pAFW9SFnplSDX50OEMdHr9ntPWIG4+JKzyt3WAMSzmP9BE88ArVJGsaiGG1mZzXtQ==
X-Received: by 2002:a05:6000:156c:b0:385:df4e:364b with SMTP id
 ffacd0b85a97d-385fd3cd9edmr6104259f8f.12.1733320645039; 
 Wed, 04 Dec 2024 05:57:25 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385e2c84d52sm13683244f8f.49.2024.12.04.05.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 05:57:24 -0800 (PST)
Date: Wed, 4 Dec 2024 14:57:22 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <klkzp5yn5kq5efgtrow6wbvnc46bcqfxs65nz3qy77ujr5turc@bwwhelz2l4dw>
References: <20241021061023.2162701-1-0x1207@gmail.com>
 <d8112193-0386-4e14-b516-37c2d838171a@nvidia.com>
 <20241128144501.0000619b@gmail.com>
 <20241202163309.05603e96@kernel.org>
 <20241203100331.00007580@gmail.com>
 <20241202183425.4021d14c@kernel.org>
 <20241203111637.000023fe@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20241203111637.000023fe@gmail.com>
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Thierry Reding <treding@nvidia.com>, Will Deacon <will@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v1] net: stmmac: TSO: Fix unbalanced
 DMA map/unmap for non-paged SKB data
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
Content-Type: multipart/mixed; boundary="===============3874501953801700518=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3874501953801700518==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vsdx7r52oh4np25i"
Content-Disposition: inline


--vsdx7r52oh4np25i
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH net v1] net: stmmac: TSO: Fix unbalanced DMA map/unmap
 for non-paged SKB data
MIME-Version: 1.0

On Tue, Dec 03, 2024 at 11:16:37AM +0800, Furong Xu wrote:
> On Mon, 2 Dec 2024 18:34:25 -0800, Jakub Kicinski <kuba@kernel.org> wrote:
>=20
> > On Tue, 3 Dec 2024 10:03:31 +0800 Furong Xu wrote:
> > > I requested Jon to provide more info about "Tx DMA map failed" in pre=
vious
> > > reply, and he does not respond yet. =20
> >=20
> > What does it mean to provide "more info" about a print statement from
> > the driver? Is there a Kconfig which he needs to set to get more info?
> > Perhaps you should provide a debug patch he can apply on his tree, that
> > will print info about (1) which buffer mapping failed (head or frags);
> > (2) what the physical address was of the buffer that couldn't be mapped.
>=20
> A debug patch to print info about buffer makes no sense here.
> Both Tegra186 Jetson TX2(tegra186-p2771-0000) and Tegra194 Jetson AGX Xav=
ier
> (tegra194-p2972-0000) enable IOMMU/SMMU for stmmac in its device-tree nod=
e,
> buffer info should be investigated with detailed IOMMU/SMMU debug info fr=
om
> drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c together.
>=20
> I am not an expert in IOMMU, so I cannot help more.
>=20
> Without the help from Jon, our only choice is revert as you said.

I was able to reproduce this locally and I get this splat:

--- >8 ---
[  228.179234] WARNING: CPU: 0 PID: 0 at drivers/iommu/io-pgtable-arm.c:346=
 __arm_lpae_map+0x388/0x4e4
[  228.188300] Modules linked in: snd_soc_tegra210_mixer snd_soc_tegra210_a=
dmaif snd_soc_tegra_pcm snd_soc_tegra186_asrc snd_soc_tegra210_ope snd_soc_=
tegra210_adx snd_soc_tegra210_mvc snd_soc_tegra210_dmic snd_soc_tegra186_ds=
pk snd_soc_tegra210_sfc snd_soc_tegra210_amx snd_soc_tegra210_i2s tegra_drm=
 drm_dp_aux_bus cec drm_display_helper drm_client_lib tegra210_adma snd_soc=
_tegra210_ahub drm_kms_helper snd_hda_codec_hdmi snd_hda_tegra snd_soc_tegr=
a_audio_graph_card at24 snd_hda_codec ina3221 snd_soc_audio_graph_card snd_=
soc_simple_card_utils tegra_bpmp_thermal tegra_xudc snd_hda_core tegra_acon=
nect host1x fuse drm backlight ipv6
[  228.243750] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G S           =
      6.13.0-rc1-next-20241203 #30
[  228.253412] Tainted: [S]=3DCPU_OUT_OF_SPEC
[  228.257336] Hardware name: nvidia NVIDIA P2771-0000-500/NVIDIA P2771-000=
0-500, BIOS 2025.01-rc3-00040-g36352ae2e68e-dirty 01/01/2025
[  228.269239] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[  228.276205] pc : __arm_lpae_map+0x388/0x4e4
[  228.280398] lr : __arm_lpae_map+0x120/0x4e4
[  228.284587] sp : ffff8000800037f0
[  228.287901] x29: ffff800080003800 x28: 0000000000000002 x27: 00000000000=
00001
[  228.295050] x26: 0000000000000001 x25: 0000000111580000 x24: 00000000000=
01000
[  228.302197] x23: 000000ffffc72000 x22: 0000000000000ec0 x21: 00000000000=
00003
[  228.309342] x20: 0000000000000001 x19: ffff00008574b000 x18: 00000000000=
00001
[  228.316486] x17: 0000000000000000 x16: 0000000000000001 x15: ffff8000800=
03ad0
[  228.323631] x14: ffff00008574d000 x13: 0000000000000000 x12: 00000000000=
00001
[  228.330775] x11: 0000000000000001 x10: 0000000000000001 x9 : 00000000000=
01000
[  228.337921] x8 : ffff00008674c390 x7 : ffff00008674c000 x6 : 00000000000=
00003
[  228.345066] x5 : 0000000000000003 x4 : 0000000000000001 x3 : 00000000000=
00002
[  228.352209] x2 : 0000000000000001 x1 : 0000000000000000 x0 : ffff0000857=
4b000
[  228.359356] Call trace:
[  228.361807]  __arm_lpae_map+0x388/0x4e4 (P)
[  228.366002]  __arm_lpae_map+0x120/0x4e4 (L)
[  228.370198]  __arm_lpae_map+0x120/0x4e4
[  228.374042]  __arm_lpae_map+0x120/0x4e4
[  228.377886]  __arm_lpae_map+0x120/0x4e4
[  228.381730]  arm_lpae_map_pages+0x108/0x250
[  228.385922]  arm_smmu_map_pages+0x40/0x120
[  228.390029]  __iommu_map+0xfc/0x1bc
[  228.393525]  iommu_map+0x38/0xc0
[  228.396759]  __iommu_dma_map+0xb4/0x1a4
[  228.400604]  iommu_dma_map_page+0x14c/0x27c
[  228.404795]  dma_map_page_attrs+0x1fc/0x280
[  228.408987]  stmmac_tso_xmit+0x2d0/0xbac
[  228.412920]  stmmac_xmit+0x230/0xd14
[  228.416505]  dev_hard_start_xmit+0x94/0x11c
[  228.420697]  sch_direct_xmit+0x8c/0x380
[  228.424540]  __qdisc_run+0x11c/0x66c
[  228.428121]  net_tx_action+0x168/0x228
[  228.431875]  handle_softirqs+0x100/0x244
[  228.435809]  __do_softirq+0x14/0x20
[  228.439303]  ____do_softirq+0x10/0x20
[  228.442972]  call_on_irq_stack+0x24/0x64
[  228.446903]  do_softirq_own_stack+0x1c/0x40
[  228.451091]  __irq_exit_rcu+0xd4/0x10c
[  228.454847]  irq_exit_rcu+0x10/0x1c
[  228.458343]  el1_interrupt+0x38/0x68
[  228.461927]  el1h_64_irq_handler+0x18/0x24
[  228.466032]  el1h_64_irq+0x6c/0x70
[  228.469438]  default_idle_call+0x28/0x58 (P)
[  228.473718]  default_idle_call+0x24/0x58 (L)
[  228.477998]  do_idle+0x1fc/0x260
[  228.481234]  cpu_startup_entry+0x34/0x3c
[  228.485163]  rest_init+0xdc/0xe0
[  228.488401]  console_on_rootfs+0x0/0x6c
[  228.492250]  __primary_switched+0x88/0x90
[  228.496270] ---[ end trace 0000000000000000 ]---
[  228.500950] dwc-eth-dwmac 2490000.ethernet: Tx dma map failed
--- >8 ---

This looks to be slightly different from what Jon was seeing. Looking at
the WARN_ON() that triggers this, it seems like for some reason the page
is getting mapped twice.

Not exactly sure why that would be happening, so adding Robin and Will,
maybe they can shed some light on this from the ARM SMMU side.

Robin, Will, any idea who could be the culprit here? Is this a map/unmap
imbalance or something else entirely?

A lot of the context isn't present in this thread anymore, but here's a
link to the top of the thread:

	https://lore.kernel.org/netdev/d8112193-0386-4e14-b516-37c2d838171a@nvidia=
=2Ecom/T/

Thanks,
Thierry

--vsdx7r52oh4np25i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmdQX78ACgkQ3SOs138+
s6H14A//WJdngiCjkoLaMyqKdSOl9WxX0+1nSuh2I5NrS/SxKcYds82Uk1/5viSs
JusZ/snx+m5+/RNO+FROgTTJJW0ZydDg7WGmJyRI/9Vg6nFE70uVWinTEsVfH+/7
f5a3erkivAOBN/TH488Lvrpq5bXxyEaJGh2gbzEHLoHPEh875VA3nZNrwCn+JLUn
u+eghjKB2I40+GnxwjM7VztGcDg9S7eB3EU4YRfUx87Tqyq7b7UIqa9jjgj4fcU5
7Bp6B/7cALh5RabcfFVZEIox3JvnYElVTDub1+oO9GYQxOk2T9z18NMi0SRIdwmG
zLUN+tooFEe9CPpaFwpvZT1MWkYlFVcgivbXx0bi6P8QFCxlUC/YTs1V6wqCUdu1
SGhWdvmlmP2BuoZL68PsFhdI5+fItGtLwV1vhQUGK3uJeGE8KsBJ37d8JY26ICQ3
+5PwFVcmNq5uzONQ4zwVkCHts7U2rJ4n6bQAkJCKI3D7HDSCtHhprzoL0FqKSi0c
8iFj1RCXw1NBRk1a8zEsGisDiRkAGYoRU6ZSlNe9rZowQkRfEPa2ojZPLklrwx7k
nKOyWfgznCB3u3gW5DBq+tuTI8fPkOMthKmq7QtU7WUeDZLZaOop4jmFwqA9z8DC
e5s9X+4D/lC7eJ8h6DGplrY2aDRYnyAMJHfMZn+i+4IzhZm1MW0=
=3eW4
-----END PGP SIGNATURE-----

--vsdx7r52oh4np25i--

--===============3874501953801700518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3874501953801700518==--
