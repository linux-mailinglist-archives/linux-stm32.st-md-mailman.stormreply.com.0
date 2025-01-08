Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B36D1A06232
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Jan 2025 17:41:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4FA6EC78F67;
	Wed,  8 Jan 2025 16:41:01 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90445C78F64
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jan 2025 16:40:54 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43624b2d453so255155e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Jan 2025 08:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736354454; x=1736959254;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/guJsq6cwbtb+0dBqQXpmlgg1lrvBQhk8AS5wE9Cuks=;
 b=OsGdaUbhq+s+tKU8nngp9HNndHerzfqNK96Cx8faMfY1pc18uhWbsFq77FGIVccdBF
 pnhjIHz3/PQ/Tm4ql/FCTL6wXewW9bcenukoflPv3Cr9F6zIJ47x8QCE+0VGNJ43zzTC
 zRPKCMxZDDhOUoXYpmaCyVQJEeaaYd+ca9iLqZy5RIuN7gVPFgehovvSkRXW1NqLsupJ
 qRrIL5ju03JydgktClaiPSAdDxSRm5nihkDm1tv+lxwzdYT2t9fUPai32mlYXWpZETyB
 uCMSaQ5n0T0QwF7Nr2oSkZ2I2lv+HTFu9+fP+nLzm7OO4UG1cawXm2aavG0Wj5M4I4Fg
 beZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736354454; x=1736959254;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/guJsq6cwbtb+0dBqQXpmlgg1lrvBQhk8AS5wE9Cuks=;
 b=Zg28b53STiBEHll9Cg00ixdsbxeJz/YdYD8oS6+ic/jZVnqokTtQy8o8Eq5PMr0F47
 F4a88hdQLH8bjbJxPqZbXuIY6i1xkakyt9QdPK5ZWuenYQqpwFRpaE9h9uGH7M+bIzZu
 yjINpSOOMjXwlj9nt9NtHliEQHdm4PbVHB4IrSFyHEni1u9//dsBW/8B7XzihY7Bugib
 aLE5TvpBlIfn6zj3A9f8ZXXdTevl+tM03IjSMwxNPM5chNinvhLAIKWA3zDyGuaBy7bz
 ah7JAgbrB8W2BO5tuKqsHPsgpBt/V/UozMOyk+lCbYaiscrlNK6in2/tMzkZq6bLuDWK
 NrRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUS0xpg6NhyPI8rcAok+JTi/jXzpynQ95txFiq92AMIGMfWrLsH5ZDU02hf44S6QIIGqNmfu8bK0Zw9g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzRlH98RU/fC97dgjnEg19z6Qj8CVGYFFnuT/uo2wmnEcXdrQY+
 wKI+hwRWEUvv6ky9fso4Xq4vY5yPb+nLKFjJ8o4vj7vgoHjhxZ2O
X-Gm-Gg: ASbGncvh5YXFKXymErZIvlMTx7dHaeLHf+5AyQZjCNRfQQ2H/yawPfmmefrm+WuhJrd
 yt3g5rCv2RHlmm3m1SHCaR2HjlzUkdjcYNjhGB7VNvLI+54YmOrQYCb81RuTuqiH0OJgGgqc+gr
 8qbdqCQ+eHX4Tfsm41ggXvQwatLoPyh2Ko6E6df8RpKHrHG+3OZHf2ADQAoYqxYMEC3u5Aab2W8
 Ix0RoCm/mQHbpIT6P6/L4voQPqi9yZfVkWgHMXYR1cEoz+Vhn7az5aDuXr9HZgmycsY7sCsMMOt
 6ECbU8STRExj/OfonzsY0XNganycVtwRvFioRLA4oHE=
X-Google-Smtp-Source: AGHT+IHwgwBkdW+ZmyxGIwkpvXTrRhp+gIkfwI9CQ0ow6tLc8HtKrjisdX6JVQfYI8d0IFvq2vZlGQ==
X-Received: by 2002:a05:600c:1c9a:b0:428:d31:ef25 with SMTP id
 5b1f17b1804b1-436e26975f1mr33250855e9.12.1736354453763; 
 Wed, 08 Jan 2025 08:40:53 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2e92794sm25856885e9.37.2025.01.08.08.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 08:40:52 -0800 (PST)
Date: Wed, 8 Jan 2025 17:40:50 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Parker Newman <parker@finest.io>
Message-ID: <oz6f5mcxi7jxyubrd6dpdltusogv5ortbmll6rom5c2bja2x7o@brsqolpmp5x7>
References: <6fb97f32cf4accb4f7cf92846f6b60064ba0a3bd.1736284360.git.pnewman@connecttech.com>
MIME-Version: 1.0
In-Reply-To: <6fb97f32cf4accb4f7cf92846f6b60064ba0a3bd.1736284360.git.pnewman@connecttech.com>
Cc: Parker Newman <pnewman@connecttech.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jonathan Hunter <jonathanh@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-tegra@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2 1/1] net: stmmac: dwmac-tegra: Read
 iommu stream id from device tree
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
Content-Type: multipart/mixed; boundary="===============6081578760806776976=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6081578760806776976==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2uonbsu5shywby2b"
Content-Disposition: inline


--2uonbsu5shywby2b
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH net v2 1/1] net: stmmac: dwmac-tegra: Read iommu stream
 id from device tree
MIME-Version: 1.0

On Tue, Jan 07, 2025 at 04:24:59PM -0500, Parker Newman wrote:
> From: Parker Newman <pnewman@connecttech.com>
>=20
> Nvidia's Tegra MGBE controllers require the IOMMU "Stream ID" (SID) to be
> written to the MGBE_WRAP_AXI_ASID0_CTRL register.
>=20
> The current driver is hard coded to use MGBE0's SID for all controllers.
> This causes softirq time outs and kernel panics when using controllers
> other than MGBE0.
>=20
> Example dmesg errors when an ethernet cable is connected to MGBE1:
>=20
> [  116.133290] tegra-mgbe 6910000.ethernet eth1: Link is Up - 1Gbps/Full =
- flow control rx/tx
> [  121.851283] tegra-mgbe 6910000.ethernet eth1: NETDEV WATCHDOG: CPU: 5:=
 transmit queue 0 timed out 5690 ms
> [  121.851782] tegra-mgbe 6910000.ethernet eth1: Reset adapter.
> [  121.892464] tegra-mgbe 6910000.ethernet eth1: Register MEM_TYPE_PAGE_P=
OOL RxQ-0
> [  121.905920] tegra-mgbe 6910000.ethernet eth1: PHY [stmmac-1:00] driver=
 [Aquantia AQR113] (irq=3D171)
> [  121.907356] tegra-mgbe 6910000.ethernet eth1: Enabling Safety Features
> [  121.907578] tegra-mgbe 6910000.ethernet eth1: IEEE 1588-2008 Advanced =
Timestamp supported
> [  121.908399] tegra-mgbe 6910000.ethernet eth1: registered PTP clock
> [  121.908582] tegra-mgbe 6910000.ethernet eth1: configuring for phy/10gb=
ase-r link mode
> [  125.961292] tegra-mgbe 6910000.ethernet eth1: Link is Up - 1Gbps/Full =
- flow control rx/tx
> [  181.921198] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> [  181.921404] rcu: 	7-....: (1 GPs behind) idle=3D540c/1/0x4000000000000=
002 softirq=3D1748/1749 fqs=3D2337
> [  181.921684] rcu: 	(detected by 4, t=3D6002 jiffies, g=3D1357, q=3D1254=
 ncpus=3D8)
> [  181.921878] Sending NMI from CPU 4 to CPUs 7:
> [  181.921886] NMI backtrace for cpu 7
> [  181.922131] CPU: 7 UID: 0 PID: 0 Comm: swapper/7 Kdump: loaded Not tai=
nted 6.13.0-rc3+ #6
> [  181.922390] Hardware name: NVIDIA CTI Forge + Orin AGX/Jetson, BIOS 20=
2402.1-Unknown 10/28/2024
> [  181.922658] pstate: 40400009 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [  181.922847] pc : handle_softirqs+0x98/0x368
> [  181.922978] lr : __do_softirq+0x18/0x20
> [  181.923095] sp : ffff80008003bf50
> [  181.923189] x29: ffff80008003bf50 x28: 0000000000000008 x27: 000000000=
0000000
> [  181.923379] x26: ffffce78ea277000 x25: 0000000000000000 x24: 0000001c6=
1befda0
> [  181.924486] x23: 0000000060400009 x22: ffffce78e99918bc x21: ffff80008=
018bd70
> [  181.925568] x20: ffffce78e8bb00d8 x19: ffff80008018bc20 x18: 000000000=
0000000
> [  181.926655] x17: ffff318ebe7d3000 x16: ffff800080038000 x15: 000000000=
0000000
> [  181.931455] x14: ffff000080816680 x13: ffff318ebe7d3000 x12: 000000003=
464d91d
> [  181.938628] x11: 0000000000000040 x10: ffff000080165a70 x9 : ffffce78e=
8bb0160
> [  181.945804] x8 : ffff8000827b3160 x7 : f9157b241586f343 x6 : eeb6502a0=
1c81c74
> [  181.953068] x5 : a4acfcdd2e8096bb x4 : ffffce78ea277340 x3 : 00000000f=
fffd1e1
> [  181.960329] x2 : 0000000000000101 x1 : ffffce78ea277340 x0 : ffff318eb=
e7d3000
> [  181.967591] Call trace:
> [  181.970043]  handle_softirqs+0x98/0x368 (P)
> [  181.974240]  __do_softirq+0x18/0x20
> [  181.977743]  ____do_softirq+0x14/0x28
> [  181.981415]  call_on_irq_stack+0x24/0x30
> [  181.985180]  do_softirq_own_stack+0x20/0x30
> [  181.989379]  __irq_exit_rcu+0x114/0x140
> [  181.993142]  irq_exit_rcu+0x14/0x28
> [  181.996816]  el1_interrupt+0x44/0xb8
> [  182.000316]  el1h_64_irq_handler+0x14/0x20
> [  182.004343]  el1h_64_irq+0x80/0x88
> [  182.007755]  cpuidle_enter_state+0xc4/0x4a8 (P)
> [  182.012305]  cpuidle_enter+0x3c/0x58
> [  182.015980]  cpuidle_idle_call+0x128/0x1c0
> [  182.020005]  do_idle+0xe0/0xf0
> [  182.023155]  cpu_startup_entry+0x3c/0x48
> [  182.026917]  secondary_start_kernel+0xdc/0x120
> [  182.031379]  __secondary_switched+0x74/0x78
> [  212.971162] rcu: INFO: rcu_preempt detected expedited stalls on CPUs/t=
asks: { 7-.... } 6103 jiffies s: 417 root: 0x80/.
> [  212.985935] rcu: blocking rcu_node structures (internal RCU debug):
> [  212.992758] Sending NMI from CPU 0 to CPUs 7:
> [  212.998539] NMI backtrace for cpu 7
> [  213.004304] CPU: 7 UID: 0 PID: 0 Comm: swapper/7 Kdump: loaded Not tai=
nted 6.13.0-rc3+ #6
> [  213.016116] Hardware name: NVIDIA CTI Forge + Orin AGX/Jetson, BIOS 20=
2402.1-Unknown 10/28/2024
> [  213.030817] pstate: 40400009 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [  213.040528] pc : handle_softirqs+0x98/0x368
> [  213.046563] lr : __do_softirq+0x18/0x20
> [  213.051293] sp : ffff80008003bf50
> [  213.055839] x29: ffff80008003bf50 x28: 0000000000000008 x27: 000000000=
0000000
> [  213.067304] x26: ffffce78ea277000 x25: 0000000000000000 x24: 0000001c6=
1befda0
> [  213.077014] x23: 0000000060400009 x22: ffffce78e99918bc x21: ffff80008=
018bd70
> [  213.087339] x20: ffffce78e8bb00d8 x19: ffff80008018bc20 x18: 000000000=
0000000
> [  213.097313] x17: ffff318ebe7d3000 x16: ffff800080038000 x15: 000000000=
0000000
> [  213.107201] x14: ffff000080816680 x13: ffff318ebe7d3000 x12: 000000003=
464d91d
> [  213.116651] x11: 0000000000000040 x10: ffff000080165a70 x9 : ffffce78e=
8bb0160
> [  213.127500] x8 : ffff8000827b3160 x7 : 0a37b344852820af x6 : 3f049caed=
d1ff608
> [  213.138002] x5 : cff7cfdbfaf31291 x4 : ffffce78ea277340 x3 : 00000000f=
fffde04
> [  213.150428] x2 : 0000000000000101 x1 : ffffce78ea277340 x0 : ffff318eb=
e7d3000
> [  213.162063] Call trace:
> [  213.165494]  handle_softirqs+0x98/0x368 (P)
> [  213.171256]  __do_softirq+0x18/0x20
> [  213.177291]  ____do_softirq+0x14/0x28
> [  213.182017]  call_on_irq_stack+0x24/0x30
> [  213.186565]  do_softirq_own_stack+0x20/0x30
> [  213.191815]  __irq_exit_rcu+0x114/0x140
> [  213.196891]  irq_exit_rcu+0x14/0x28
> [  213.202401]  el1_interrupt+0x44/0xb8
> [  213.207741]  el1h_64_irq_handler+0x14/0x20
> [  213.213519]  el1h_64_irq+0x80/0x88
> [  213.217541]  cpuidle_enter_state+0xc4/0x4a8 (P)
> [  213.224364]  cpuidle_enter+0x3c/0x58
> [  213.228653]  cpuidle_idle_call+0x128/0x1c0
> [  213.233993]  do_idle+0xe0/0xf0
> [  213.237928]  cpu_startup_entry+0x3c/0x48
> [  213.243791]  secondary_start_kernel+0xdc/0x120
> [  213.249830]  __secondary_switched+0x74/0x78
>=20
> This bug has existed since the dwmac-tegra driver was added in Dec 2022
> (See Fixes tag below for commit hash).
>=20
> The Tegra234 SOC has 4 MGBE controllers, however Nvidia's Developer Kit
> only uses MGBE0 which is why the bug was not found previously. Connect Te=
ch
> has many products that use 2 (or more) MGBE controllers.
>=20
> The solution is to read the controller's SID from the existing "iommus"
> device tree property. The 2nd field of the "iommus" device tree property
> is the controller's SID.
>=20
> Device tree snippet from tegra234.dtsi showing MGBE1's "iommus" property:
>=20
> smmu_niso0: iommu@12000000 {
>         compatible =3D "nvidia,tegra234-smmu", "nvidia,smmu-500";
> ...
> }
>=20
> /* MGBE1 */
> ethernet@6900000 {
> 	compatible =3D "nvidia,tegra234-mgbe";
> ...
> 	iommus =3D <&smmu_niso0 TEGRA234_SID_MGBE_VF1>;
> ...
> }
>=20
> Nvidia's arm-smmu driver reads the "iommus" property and stores the SID in
> the MGBE device's "fwspec" struct. The dwmac-tegra driver can access the
> SID using the tegra_dev_iommu_get_stream_id() helper function found in
> linux/iommu.h.
>=20
> Calling tegra_dev_iommu_get_stream_id() should not fail unless the "iommu=
s"
> property is removed from the device tree or the IOMMU is disabled.
>=20
> While the Tegra234 SOC technically supports bypassing the IOMMU, it is not
> supported by the current firmware, has not been tested and not recommende=
d.
> More detailed discussion with Thierry Reding from Nvidia linked below.
>=20
> Fixes: d8ca113724e7 ("net: stmmac: tegra: Add MGBE support")
> Link: https://lore.kernel.org/netdev/cover.1731685185.git.pnewman@connect=
tech.com
> Signed-off-by: Parker Newman <pnewman@connecttech.com>
> ---
>=20
> Changes v2:
> - dropped cover letter
> - added more detail to commit message
> - rebased to latest netdev tree
>=20
>  drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--2uonbsu5shywby2b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmd+qpIACgkQ3SOs138+
s6FilhAArehaljH1La9BTRwP2lKEUwFU5AjTkeTdvAeg+h0For7hW+0icZCCsu/N
7RPZ5oKSzU0lqQKb9MBMSO29ecbkvR0OnZnKtN8LWibwOaMo0Tw+l1y+/h9vbiF8
MPQpKgIDqm/Qtk0VsEHtys6PnU4jTdFo5CF3abq+KyU0wmh94VLu8zWZIOqNns8p
GonxHxaFivU5jIVrTYZwwTo3fZf2k2xJJf02L05K8+SNew/0NNDOubTCE8U/akWk
hjPKr18wehk1DDh5Uheen2dPsPVIKwkikmAwaa6lwU7SnTDH0PEALw3TtlN16cDi
AMthb5rg0O+7rw7maUAb3nmZVAVxv9/jIHvd9eMPV+JcsNiZABJ5cMh28Op8mD+P
lf7Fm20l9ZijGKgIxG9vsQ46yLL0+8sGtW6utG17l1/OoU5rConONY0M0Fb800pY
Ph97Ufxq5xDmK8zTA58pLLJkgu9uVpxes0kpk5RByOAbBA/KyiBNlTEW/FOY2uWg
8sHxX8l8rZo9OKnGWFihJQJl+DTW8VXN7oY92Pt23jlXrMwfiwPnf+a07TLQ0nRf
ZePp7G6OmyfmInQaMsxFeyn7voW64gIdoY+7X+t2y7M68BiwP7fQil9w+VGFjaRH
V3nN10wsEpuU7UgcW4wYxDm+edGupkzySs413scbgzD3ue7WSic=
=YtPl
-----END PGP SIGNATURE-----

--2uonbsu5shywby2b--

--===============6081578760806776976==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6081578760806776976==--
