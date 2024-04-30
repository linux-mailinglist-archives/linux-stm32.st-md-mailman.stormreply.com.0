Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 473528B81B9
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Apr 2024 23:02:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD934C7128C;
	Tue, 30 Apr 2024 21:02:40 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0DDAC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Apr 2024 21:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714510952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=GEXNjb7aeNcvCnxPKRJWZCd/nJbe22HDnX8o5WGN7ew=;
 b=Wes5OazcI3PujOnaBbwbfTub3fBB2f2gTGc5B+PzocOQtYhyihm3p/sncZNr81O51q+CP/
 WBnFcHWT2BwymbnDo0fSZmB6dXsUKGqAOmzVJYKEtSHqBSIDLM9+xXTtH3U3BZlPuqHrcR
 D1Xa2wSUBLHwGuQzlqOGlV1dp6umzZg=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-X5_RTSqCMXy5iXBxFBDg2w-1; Tue, 30 Apr 2024 17:02:30 -0400
X-MC-Unique: X5_RTSqCMXy5iXBxFBDg2w-1
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-6ed4298be66so4326764b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Apr 2024 14:02:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714510944; x=1715115744;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GEXNjb7aeNcvCnxPKRJWZCd/nJbe22HDnX8o5WGN7ew=;
 b=H9fVTGXtbxf3sk5+ytK83o3kabSJNV/j7Q7TL3WVE7bOqQYb9MIqHl4PLbppmJZqpA
 YopkuvGID1Kt9riq3EGtcK79Y+y/h8AfZJC0DV/4JCXUNxMJpfKhGT97OXSQgb72AiEq
 SGe8IV5lBmuuEVHxo7PnlLQC9ZpEAlJe8HqmAE3gc50tnFIuRq5o2ksASNF9z0bCAJWc
 tP2qg3Q/A1yCA4z5+Jjd3wXKxBsKV57Da3DoHofaqtbljMXA/+765iEGoSXme/lOjl85
 dHHmcEVIGXaaq6F9in4YbWESnXynsCfpVaXhhpl4CNK0Hqbh4TVyeDLSYnFZ9FVIyfKC
 O9xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXv471JihHr+klJqDbhho1U6CJfC8BP/F2vAczSHctAo4GlwkdlUU1Xtv//x+q8u6JydrsZYm/ePNd4PUrHrdPFu/B9cZuTZxQ6MlnU6gZJN/FfernkYUwF
X-Gm-Message-State: AOJu0YzyXQaevHsHWe3bJOpkAdGNpbck6xovzEA4Emzzv707pJi7PCc9
 ui1UAU2TiWtvgOMWoK527Qu0BcwSejverTok0rZ58YgCe11iHD5j6zoB2V1bg4SZkk1dsZPHCNc
 dICA2pvvyXl9V2Wu2dvIUbPvABT1h6YqLBOndafhZRwnSQm/y8I5na/Uju0+8kpcHkUO7IBocf2
 bs/Q==
X-Received: by 2002:a05:6a20:9192:b0:1a7:6262:1dd1 with SMTP id
 v18-20020a056a20919200b001a762621dd1mr1260979pzd.51.1714510943706; 
 Tue, 30 Apr 2024 14:02:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCRcUNpm+xZQh5a6xxgdrE7aGEQmRLABr6Gp4YxdclyZ03Q2COt1Nwd0VZF7JFkFyG2Zg9Cg==
X-Received: by 2002:a05:6a20:9192:b0:1a7:6262:1dd1 with SMTP id
 v18-20020a056a20919200b001a762621dd1mr1260940pzd.51.1714510943135; 
 Tue, 30 Apr 2024 14:02:23 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
 by smtp.gmail.com with ESMTPSA id
 lo8-20020a056a003d0800b006ed4823671csm22223770pfb.15.2024.04.30.14.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 14:02:22 -0700 (PDT)
Date: Tue, 30 Apr 2024 16:02:19 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org
Message-ID: <uz66kbjbxieof6vkliuwgpzhlrbcmeb2f5aeuourw2vqcoc4hv@2adpvba3zszx>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: andrew@lunn.ch, linux@armlinux.org.uk, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, hkallweit1@gmail.com
Subject: [Linux-stm32] racing ndo_open()/phylink*connect() with phy_probe()
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

Hi,

I've been taking a look at the following error message:

    qcom-ethqos 23000000.ethernet end1: __stmmac_open: Cannot attach to PHY (error: -19)

end1 is using a phy on the mdio bus of end0, not on its own bus. Something
like this devicetree snippet highlights the relationship:

    // end0
    &ethernet0 {
            phy-mode = "sgmii";
            phy-handle = <&sgmii_phy0>;

            mdio {
                    compatible = "snps,dwmac-mdio";
                    sgmii_phy0: phy@8 {
                            compatible = "ethernet-phy-id0141.0dd4";
                            reg = <0x8>;
                            device_type = "ethernet-phy";
                    };

                    sgmii_phy1: phy@a {
                            compatible = "ethernet-phy-id0141.0dd4";
                            reg = <0xa>;
                            device_type = "ethernet-phy";
                    };
            };
    };

    // end1
    &ethernet1 {
            phy-mode = "sgmii";
            phy-handle = <&sgmii_phy1>;
    };

Basically, NetworkManager is setting both interfaces to up, and end1's
phy doesn't seem to be ready when ndo_open() runs, returning
-ENODEV in phylink_fwnode_phy_connect() and bubbling that back up. This doesn't
happen very often, but by shoving things into the initramfs or anything to
speed up probe/ndo_open() it's easier to reproduce. Delaying probe()
of end0 and then setting end1 up is another easy way to reproduce.

My question after looking around for a while, is what is the expectation
of userspace in this situation?

NetworkManager retries 4 times right now (tunable via autoconnect-retries setting),
and if you're lucky that's good enough. You could tell it to retry infinitely,
that should get me out of my bind at least, but it's not an amazing solution.

I'm used to dealing with deferral issues in probe() callbacks, but
to me it seems that phylink and netdev sort of move the phy part of the problem
till later (so you don't get the kernel retrying for you, etc, like you do
with deferred probes) when you ndo_open(). I guess the logic there is that
the phys could be hot pluggable, so with phylink we delay getting at them
until ndo_open()? I also guess if the mac is going to create an mdio bus
with phys off of it that also gets dicey as the phy could -EPROBE_DEFER
when you're trying to probe the mac and confirm its phy is ready..

Is retrying the correct solution here from userspace, or am I missing something?
I thought the "does not support carrier detection" below might be my ticket out
of this, but I can still reproduce it even after patching[0] to make that work.
I guess NetworkManager still brings the device up, but doesn't "activate" the
connection until the carrier detect stuff is done.

[0] https://lore.kernel.org/netdev/20240429-stmmac-no-ethtool-begin-v1-1-04c629c1c142@redhat.com/

Thanks,
Andrew

Some logs to illustrate the issue with a little more context (without
the patch in [0], in the end that doesn't help):

[    1.541839] fedora kernel: qcom-ethqos 23000000.ethernet end1: renamed from eth0
[    1.545750] fedora NetworkManager[407]: <info>  [1709251201.1647] device (eth0): driver '(null)' does not support carrier detection.
[    1.545826] fedora NetworkManager[407]: <info>  [1709251201.1657] device (eth0): driver 'unknown' does not support carrier detection.
[    1.545854] fedora NetworkManager[407]: <info>  [1709251201.1660] manager: (eth0): new Ethernet device (/org/freedesktop/NetworkManager/Devices/2)
[    1.545880] fedora NetworkManager[407]: <info>  [1709251201.1678] device (eth0): interface index 2 renamed iface from 'eth0' to 'end1'
[    1.551721] fedora NetworkManager[407]: <info>  [1709251201.1794] device (end1): state change: unmanaged -> unavailable (reason 'managed', sys-iface-state: 'external')
[    1.554944] fedora kernel: qcom-ethqos 23000000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-0
[    1.555962] fedora kernel: qcom-ethqos 23000000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-1
[    1.557711] fedora kernel: qcom-ethqos 23000000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-2
[    1.558721] fedora kernel: qcom-ethqos 23000000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-3
[    1.560297] fedora kernel: qcom-ethqos 23000000.ethernet end1: __stmmac_open: Cannot attach to PHY (error: -19)
[    1.573664] fedora NetworkManager[407]: <info>  [1709251201.2013] device (end1): state change: unavailable -> disconnected (reason 'none', sys-iface-state: 'managed')
[    1.574344] fedora NetworkManager[407]: <info>  [1709251201.2020] policy: auto-activating connection 'Wired Connection' (bfe920e8-6031-4129-bf5c-78198427076a)
[    1.574733] fedora NetworkManager[407]: <info>  [1709251201.2024] device (end1): Activation: starting connection 'Wired Connection' (bfe920e8-6031-4129-bf5c-78198427076a)
[    1.578589] fedora kernel: qcom-ethqos 23000000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-0
[    1.579351] fedora kernel: qcom-ethqos 23000000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-1
[    1.580102] fedora kernel: qcom-ethqos 23000000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-2
[    1.578337] fedora NetworkManager[407]: <info>  [1709251201.2027] device (end1): state change: disconnected -> prepare (reason 'none', sys-iface-state: 'managed')
[    1.578404] fedora NetworkManager[407]: <info>  [1709251201.2030] manager: NetworkManager state is now CONNECTING
[    1.578431] fedora NetworkManager[407]: <info>  [1709251201.2033] device (end1): state change: prepare -> config (reason 'none', sys-iface-state: 'managed')
[    1.580965] fedora kernel: qcom-ethqos 23000000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-3
[    1.582390] fedora kernel: qcom-ethqos 23000000.ethernet end1: __stmmac_open: Cannot attach to PHY (error: -19)
[    1.593993] fedora NetworkManager[407]: <info>  [1709251201.2217] device (end1): state change: config -> failed (reason 'config-failed', sys-iface-state: 'managed')
[    1.648395] fedora NetworkManager[407]: <info>  [1709251201.2220] manager: NetworkManager state is now DISCONNECTED
[    1.648634] fedora NetworkManager[407]: <warn>  [1709251201.2222] device (end1): Activation: failed for connection 'Wired Connection'
[    1.648926] fedora NetworkManager[407]: <info>  [1709251201.2224] device (end1): state change: failed -> disconnected (reason 'none', sys-iface-state: 'managed')
[    1.649179] fedora NetworkManager[407]: <info>  [1709251201.2233] manager: startup complete
[    1.834016] fedora NetworkManager[407]: <info>  [1709251201.4617] device (eth0): driver '(null)' does not support carrier detection.
[    1.836553] fedora NetworkManager[407]: <info>  [1709251201.4624] device (eth0): driver 'unknown' does not support carrier detection.
[    1.836628] fedora NetworkManager[407]: <info>  [1709251201.4627] manager: (eth0): new Ethernet device (/org/freedesktop/NetworkManager/Devices/3)
[    1.896859] fedora kernel: qcom-ethqos 23040000.ethernet end0: renamed from eth0
[    1.902243] fedora NetworkManager[407]: <info>  [1709251201.5299] device (eth0): interface index 3 renamed iface from 'eth0' to 'end0'
[    1.911400] fedora kernel: qcom-ethqos 23040000.ethernet end0: Register MEM_TYPE_PAGE_POOL RxQ-0
[    1.909632] fedora NetworkManager[407]: <info>  [1709251201.5357] device (end0): state change: unmanaged -> unavailable (reason 'managed', sys-iface-state: 'external')

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
