Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMP5NXUj2GmNYggAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Apr 2026 00:08:53 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3873D01D4
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Apr 2026 00:08:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1BD68C87ECC;
	Thu,  9 Apr 2026 22:08:53 +0000 (UTC)
Received: from mail-yw1-f227.google.com (mail-yw1-f227.google.com
 [209.85.128.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6808BC08D19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Apr 2026 22:08:52 +0000 (UTC)
Received: by mail-yw1-f227.google.com with SMTP id
 00721157ae682-79a74765703so13539257b3.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Apr 2026 15:08:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775772531; x=1776377331;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AtR49FCfrmNin2ZYC82Zsb3OQIwzw1yjSHc9PKh52XU=;
 b=kcQ6fWKxOAsrHqfO8I3eB7a5ojZNGe/SoySStaajoqmM8MymwLaxYzunYFAkdNGYO5
 rZTLSnna7m/AKItqQqeN/RFcwgV9QeEXw6sLNH+kyDR/6JDoF05zmQYbQEpisALUlIbO
 CSjXEi+g6FrGEdyX2ixLeVB9S4s80Wek/TjsWMAOfj9rKdAtJoQH0kmKJcu0KGZNjbd4
 1Rzck6np+pYoXGS4llJumqhq+VjcEcdP6OP9psPLEtfSBfvJxBkIzKJoQGGPTPO1WklJ
 44c9JnTXa0n1IPMpjxORYnHHhj1oLWnjqbsx1kU2N8+5WyL4uZ1twhNTyvvJw0tvGJAZ
 MQkQ==
X-Forwarded-Encrypted: i=2;
 AJvYcCViO42ai0gX5OO23ZVv9VwXvRzHzs5zYKAe0I/fkHkVY84ZHtlu355DnCr8v9cGrH6AqeodrjwUtAgCng==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzg9lQ78p5VXS7GENjAdzFv84V9XkpauZ8CGUA3JiP91TfFIVj5
 /35D0Q4QnWDKrhSLeIpRgCIy3VBnl+MCrHz3qeoIuqgJuOmSPaAqXEgfy3YLlhFcWtaOurwieMV
 nE9+QwjsXy81U31+cHHD3obRPJQxV7b5BtUWcFNpOj9sGYLmewf6+A2ERZJkihThg71axhb5WZj
 ZEKZh5T/Pc2TLnzqjNSMr1Ho0+62ECtFSREvp4X1Qu45FCRNmghqPi8feJUt9L5/vcntBvrB8/m
 nu5bsYKFdmr0tB9HSEP7lW2vzDCzB6iCaAT14PEvg==
X-Gm-Gg: AeBDiesxXBNJz0Mo84YHcPfIvp5/CsPT4BzFYYzDmTXyuNbSA2e2FNpUZcY54LtTWSe
 WBHQJt3W00t96E5zDZuFGiX/opAhYvmunmgXAtxE5CsfcYGeS66WBVKhvZLHKfrO50kYT/TSf/Y
 N2OsK9u4F+BZ8fZIawPVDhJofPb/w4nrvSsji3FklHiUigQ7q9hOT6ahky+yj7A6yFXKeSGSUQa
 yETX8W6lREvf8a/DdZnrwCQp5+XzTbzZ7MGwGt2T5P766Vzz7mtBKiPcHnd2bit/7rpMJYGueax
 BgSWpWK4pD2E4fEkBqPDL2GGXqAln+0JSiCWmycpA2YZSwEpRCpVvoVBfM8DmAa7W2+1k2Llc92
 DuVapgPfGAJsHTSq3k/Bz7KdTV2+c9pbYgAWgwVwktmCwvoWx4oUeqzzng7Ldk11keYE+I98BNC
 6Q3i3dBG3wMDs2hhwbdlQVIPm/P8ww/DByGsozoth6PvZ4TI0Zrbd6XYCpQc6dnuw=
X-Received: by 2002:a05:690c:85:b0:7a2:f14d:5a1 with SMTP id
 00721157ae682-7af7252df6emr7612707b3.49.1775772530919; 
 Thu, 09 Apr 2026 15:08:50 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
 by smtp-relay.gmail.com with ESMTPS id
 00721157ae682-7af3e76f813sm592957b3.10.2026.04.09.15.08.50
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Apr 2026 15:08:50 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-43d03ae4f2aso986200f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Apr 2026 15:08:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775772529; cv=none;
 d=google.com; s=arc-20240605;
 b=IGk+n3feeqhI9kSrwq3KMxYKSnf3wtZdQxyrpBGv/vOOsTVhR3whr1VhupOU+stFao
 BpzVkszyjgQi7V338XNzlOEMyN4XM46t1jfWNxV7DlZf3tV+FNVf4ItyvxE1DXqViPYL
 4Fqb9KMMQqc88O466ZU4ayy0XoQ1e1Qq7FCx42yZyb3pNwAL5TjXkmfrJBOJ1iWZE9Ia
 9GFbIj8Chu0d2KxXkpw4EEVArPJRHxWy96YpR/eo0Py3Ejv4TQwaSPsNK7ksUKwLsiHK
 XeBq1VYSkDfpCKPaTKT4DaUm1IwwlVfadXT/7RQZR6JqQ5yDZTrzguZdAh/L0lS4pIDQ
 zHGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=AtR49FCfrmNin2ZYC82Zsb3OQIwzw1yjSHc9PKh52XU=;
 fh=TII2qygisJDIgjfBYBkcrocfsMZ6vNdgkpJz/smFuEg=;
 b=BupC+ql9JV2M8h4tpQtUQXaymRgvOMYoki9xJCh79aFin7NyZSWWIcWJKo2i5IuZrc
 WK9wmrbhW6ip+4YmLe0xGZ4lU1zc4xBKCa7yrrKNCAOBM7/RYxlyH/tNhqcqHswMUQea
 IbzBJgcYX5PrzcXBO9S6OkkziDXT9oHE32GOfsmc8Sv6afHBzW8sYN++weg2OBosoPG4
 hjYNlYL5sqVt7tHZVeU7R7hdWJvai1Qup6u8UIHx94ddB7Af9t81dFwwCMjwew7i+wyO
 wBxdOu0IsJC8bjvPp14toLoySavN+LMb+OLHkl5yanm4TwDjk5uKsqGPV3MJg2UxJM7f
 NOfw==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1775772529; x=1776377329;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AtR49FCfrmNin2ZYC82Zsb3OQIwzw1yjSHc9PKh52XU=;
 b=MnXY/R98QP9zvhMK+uZYoiytCGtCaXFmZepq4piJDGW7AM7eIt6UcKzTp/k5S3QBuG
 6F0ziIDVdwho+5R1tBC5tO5QhY5exBZtia+RjphbbALHDggCwLMf86TA1bVkVv7oJECW
 L8Kgf+I3vX5RY5F/rY/Nq2UHZA7gEzPWOsiWU=
X-Forwarded-Encrypted: i=1;
 AJvYcCXz2CMwwjRJL07jBDtRArSNQgrbuH0Kq9bCPVIA4dNxmtMex4p2pdsdnIk3/gQs6mq8InHOaYQS76P9rg==@st-md-mailman.stormreply.com
X-Received: by 2002:a5d:5f87:0:b0:43b:4703:9de5 with SMTP id
 ffacd0b85a97d-43d642dccc3mr1022155f8f.44.1775772529169; 
 Thu, 09 Apr 2026 15:08:49 -0700 (PDT)
X-Received: by 2002:a5d:5f87:0:b0:43b:4703:9de5 with SMTP id
 ffacd0b85a97d-43d642dccc3mr1022125f8f.44.1775772528655; Thu, 09 Apr 2026
 15:08:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260402213629.1996133-1-jitendra.vegiraju@broadcom.com>
 <adSxQpAE0nY0ulfU@shell.armlinux.org.uk>
In-Reply-To: <adSxQpAE0nY0ulfU@shell.armlinux.org.uk>
From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Date: Thu, 9 Apr 2026 15:08:35 -0700
X-Gm-Features: AQROBzArt3I8bemRMGDxmah0OqjGLcvGglqY0L8HZtuxxXqb_QYUkXgoucoT5Fg
Message-ID: <CAMdnO-J0Ss=+sp+aJA2TOiNPvzAv37MN05gwVZTGJmh3L4n7sQ@mail.gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Cc: quic_abchauha@quicinc.com, vladimir.oltean@nxp.com, chenchuangyu@xiaomi.com,
 edumazet@google.com, lizhi2@eswincomputing.com, yangtiezhu@loongson.cn,
 linux-stm32@st-md-mailman.stormreply.com, weishangjuan@eswincomputing.com,
 daniel@iogearbox.net, chenhuacai@kernel.org, john.fastabend@gmail.com,
 siyanteng@cqsoftware.com.cn, sdf@fomichev.me,
 bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org, pabeni@redhat.com,
 hawk@kernel.org, richardcochran@gmail.com, rohan.g.thomas@altera.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, ast@kernel.org, wens@kernel.org,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 florian.fainelli@broadcom.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, boon.khai.ng@altera.com,
 horms@kernel.org, bpf@vger.kernel.org, davem@davemloft.net,
 ovidiu.panait.rb@renesas.com
Subject: Re: [Linux-stm32] [PATCH net-next v9 0/4] net: stmmac: Add PCI
	driver support for BCM8958x
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
Content-Type: multipart/mixed; boundary="===============1575061697648796548=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [4.19 / 15.00];
	DMARC_POLICY_REJECT(2.00)[broadcom.com : SPF not aligned (relaxed),reject];
	SIGNED_SMIME(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[broadcom.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:quic_abchauha@quicinc.com,m:vladimir.oltean@nxp.com,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:lizhi2@eswincomputing.com,m:yangtiezhu@loongson.cn,m:linux-stm32@st-md-mailman.stormreply.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:bcm-kernel-feedback-list@broadcom.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:hawk@kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:ast@kernel.org,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:florian.fainelli@broadcom.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:horms@kernel.org,m:bpf@vger.kernel.org,m:davem@davemloft.net,m:ovidiu.panait.rb@renesas.com,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,m:andrew@lunn.c
 h,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[jitendra.vegiraju@broadcom.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[broadcom.com:-];
	HAS_ATTACHMENT(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jitendra.vegiraju@broadcom.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[quicinc.com,nxp.com,xiaomi.com,google.com,eswincomputing.com,loongson.cn,st-md-mailman.stormreply.com,iogearbox.net,kernel.org,gmail.com,cqsoftware.com.cn,fomichev.me,broadcom.com,redhat.com,altera.com,bp.renesas.com,lists.infradead.org,vger.kernel.org,lunn.ch,davemloft.net,renesas.com];
	NEURAL_HAM(-0.00)[-0.981];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,broadcom.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 6D3873D01D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--===============1575061697648796548==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000d5a1b6064f0e421a"

--000000000000d5a1b6064f0e421a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Russell,

On Tue, Apr 7, 2026 at 12:25=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Thu, Apr 02, 2026 at 02:36:25PM -0700, Jitendra Vegiraju wrote:
> > From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
> >
> > This patchset adds basic PCI ethernet device driver support for Broadco=
m
> > BCM8958x Automotive Ethernet switch SoC devices.
> >
> > The MAC block on BCM8958x is based on Synopsis XGMAC 4.00a core. This
> > MAC IP introduces new DMA architecture called Hyper-DMA for virtualizat=
ion
> > scalability.
> >
> > Driver functionality specific to new MAC (DW25GMAC) is implemented in
> > new file dw25gmac.c.
>
> Sorry for suggesting this rather late, but I recently came across
> another stmmac driver in the kernel - drivers/net/ethernet/synopsys.
> This is for XLGMAC, but I wonder whether it may be a better bet for
> this core. Have you looked at it?
>
I wasn't aware of this driver earlier. We are looking into this driver now.
Thanks
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

--000000000000d5a1b6064f0e421a
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
tJVewHuOmXgWQxNWV7Oiszu1d9xAcqyj65s1PrEIIaHnxEM3eTK+teecLEy8QymZjjDTrCHg4x36
2AczdlQAIiq5TSAucGja5VP8g1zTnfL/RAxEZvLS471GABptArolXY2hMVHdVEYcTduZlu8aHARc
phXveOB5/l3bPqpMVf2aFalv4ab733Aw6cPuQkbtwpMFifp9Y3s/0HGBfADomK4OeDTDJfuvCp8g
a907E48SjOJBGkh6c6B3ace2XH+CyB7+WBsoK6hsrV5twAXSe7frgP4lN/4Cm2isQl3D7vXM3PBQ
ddI2aZzmewTfbgZptt4KCUhZh+t7FGB6ZKppQ++Rx0zsGN1s71MtjJnhXvJyPs9UyL1n7KQPTEX/
07kwIwdMjxC/hpbZmVq0mVccpMy7FYlTuiwFD+TEnhmxGDTVTJ267fcfrySVBHioA7vugeXaX3yL
SqGQdCWnsz5LyCxWvcfI7zjiXJLwefechLp0LWEBIH5+0fJPB1lfiy1DUutGDJTh9WZHeXfVVFsf
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGbTCCBFWg
AwIBAgIMGHX6KxYK3WW2YyprMA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI0MDkyNTEzNTAzMVoXDTI2MDkyNjEzNTAzMVowgbMxCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzEWMBQGA1UEChMNQlJPQURDT00gSU5DLjEaMBgGA1UEAxMRSml0ZW5kcmEgVmVnaXJhanUx
LTArBgkqhkiG9w0BCQEWHmppdGVuZHJhLnZlZ2lyYWp1QGJyb2FkY29tLmNvbTCCASIwDQYJKoZI
hvcNAQEBBQADggEPADCCAQoCggEBAKWV+9PYvG4njqRsbQas79f8Q46VL7b1ZxvWT6ik6VMbdRZx
tfpfZalVXksqcb02/N1H7UA9V04cV2q97FkSr/KxeFLMetPb3cVJZICg23IRO2NTPdmgPFzwkPTo
35h9h/OYLgh3/9a1nTsC2xqJa8GtohD5+42rsskGcI57U4n1r1L4R5IL9ypSqDxX/xVEAdGI5FTj
VgvoZC6iuEbnez+yO8TT3wun9b/PQowOB5P0CwIFv7ERW0S1s6B8yrbsoaTrz0vQaEA786k1pZkg
ykC1+zXq/iTyZuPP4B4RkzFd43Pw+GAH0Tt2nx5V4rNisJHeAVNU92Gj01cEg0I+FnsCAwEAAaOC
Ad8wggHbMA4GA1UdDwEB/wQEAwIFoDCBkwYIKwYBBQUHAQEEgYYwgYMwRgYIKwYBBQUHMAKGOmh0
dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjZzbWltZWNhMjAyMy5jcnQw
OQYIKwYBBQUHMAGGLWh0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAy
MzBlBgNVHSAEXjBcMAkGB2eBDAEFAwEwCwYJKwYBBAGgMgEoMEIGCisGAQQBoDIKAwIwNDAyBggr
BgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIw
ADBBBgNVHR8EOjA4MDagNKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWlt
ZWNhMjAyMy5jcmwwKQYDVR0RBCIwIIEeaml0ZW5kcmEudmVnaXJhanVAYnJvYWRjb20uY29tMBMG
A1UdJQQMMAoGCCsGAQUFBwMEMB8GA1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1Ud
DgQWBBRq5Jlxz3MqC+zEgUxK566xEc2g3DANBgkqhkiG9w0BAQsFAAOCAgEARXrmeeWA31pp9Tr0
M6mOlMv+Pr2raES4GzPSyftvxf6tBQCBNaqi6LSbyusDYOj3mG9bp6VeVn+68OxNY9iNAk+ujtId
f3+30BlZOQ1v8z9u2peUOUtWI60y2MxhdH0X0n2H+BCGvUOFqs5z440jqqy1HsscZTXHB7FEZmVP
fyD+0Z6cxyh7WNC6+BgLiFwf8iqmAbu7Yb1sGTUGyS5gfYEjJbF2PJfwNUcJDd7eS4w5Ju5mK5y7
spgjH2/JmDgbkpSk9JyuWfjGZIg4ah/q2nb6UMd1XJb6gLQZuzPOI3SgXPvd8MHGjKZrX2BHOBSC
bJJ8rp4w4a9QMS6dde2MFObusxkZAft4tUnwo+ProchHs7iA85sL7sWEZhAmjmKKCpECpEfZm0+/
hpvKQV3AZp5vBstb4IVL8QmLj8beDVHYnNhEicsSiG1wW7zSYyBnmGbFRrFQIJnJDWPjTZOlVEyp
T1ShrXRCtqJpOt6rgg+rFEY3D8j6/bAkJXnmKnE2LZ0YyrrKk7eC6UfNNimx38w3NWchtcGY8zJn
Y/1/C9Jv/mWm/2lK8nvusOFxhKmbG83Hx8toQdZ5F1kYk6zAWjfB7lwXr/En9mCmLieJ18hen9EK
qbYyUkmCmuoLi5GXFMJy+iQv6DgMVQ7CACagybU6FUrmL9lVa+A6caBEEh4xggJXMIICUwIBATBi
MFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9i
YWxTaWduIEdDQyBSNiBTTUlNRSBDQSAyMDIzAgwYdforFgrdZbZjKmswDQYJYIZIAWUDBAIBBQCg
gccwLwYJKoZIhvcNAQkEMSIEILuLmSSO4fRKTPTuCUL9ZTZdoL2rS4KMUF6rJInr/XkbMBgGCSqG
SIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDQwOTIyMDg0OVowXAYJKoZI
hvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG
9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAJjVU0MvI29h
uY7bvx9vWk/zixT5OP5qh07gQ9ZF9enzeLyx+PJ+FN8nDKF6+sRt2oK57Z/N+zupzhJ8rkQLg/ga
Vae5b8gm1TEdtKWoKjlVg15ODGKq0Yl9xpoE8z1FXc7jtzlszLRjxfDG9kpPtIV+fESaJ948mWM+
Dj+3E9D7GwmUERU4IRcd16s26H3vlHeIzlccQqYyitsy+gq8lArA1S1Xoub06MRPb1oGEnuzt2iV
DfacCXZyQpO1r7f6dLyk0DQdGseZS1qZBL+mvF8voTPWMvQCJcUgxDeBMBgRaIYCqiKAaf2M7jY7
PdVbSt7f6/FRFOnIQM6hwwFig08=
--000000000000d5a1b6064f0e421a--

--===============1575061697648796548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1575061697648796548==--
