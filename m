Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIb/CYRpuGlEdgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 21:35:16 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B06FF2A043A
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 21:35:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 543ABC87ED8;
	Mon, 16 Mar 2026 20:35:15 +0000 (UTC)
Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com
 [209.85.214.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61208C87EC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 20:35:13 +0000 (UTC)
Received: by mail-pl1-f227.google.com with SMTP id
 d9443c01a7336-2ad617d5b80so35834025ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 13:35:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773693312; x=1774298112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y96+P3bhlS1rCYBJCL2EP/mHsZ1Sdzqb26b1pUwJYQw=;
 b=LPL5ubHmanCKpUDMnH/iBUbPKYa+3Rv1WTHnz9ymAdU4PAGXvYmhz8ZI3a+VTyN729
 e1ZorTlr5CvwdjIdpYXHuJ5uEyQwE3QTOFmxGyDDopxrG/RNws/b1nsCFVMjaOuUv2QG
 znp48fuGiw+XZ6bNw23LGegQv/2g/xm1txlgK8lm5k1DDVl70nQoYlRqyrH6Y2L9WEx1
 HI7ivsErhuHUT9s5cO0IwjzLpGCRec9zHznptSi2TtMV8fk3TxCQ94HRkXjvGO4EX9TA
 D3sHSK8T1QpW3rCzKulxtuFEfhLq4l4t3D9UkAkaZj+FNB82FSAcsrQlxSNeS6WKk38x
 EpJg==
X-Forwarded-Encrypted: i=2;
 AJvYcCV/bpswJijZ7DAmoI7nUR4op9xg9fyoj4g693e4NPrpileLa4Nn5U3CZ0Zrue2F1RCcOGEQbnUiWQYqEQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxzPyHizBp0QCeiBd0xAtVEY1bMnxFBeFqfZFbUqv299zCyfvSm
 kPABXAbFmCOmqNGid/f//pVlQ/cr4KEa5oP2tcP42tyTkmgPky9yrOMax4UudxBpXFCWSB+C7Kd
 Nq5I6U8fSHcQ007x5VzMyfYMP7zPD8E2Y/P4eFmwVIM3Hdb4fu//JZWMXj2xYS5KCC4OPyxskTW
 Mdu+TP6UwYhp1AZFbuQpppD5yrkZ99W3u8zof+U/AGTSYOXSPWHj0yLL7IA8CC4fg7v2IHLkpI2
 JGOSRUDpUkr4MxtV4buHf0vCQ148LL/3GquPjHBoA==
X-Gm-Gg: ATEYQzz6Fj7+vG3kEX8KPajMEEKEM1qjNg2k3TbRB0A9KieVdHy4ZqvZ++ve7FKV9Ok
 fqEcvTv3oWtqiGMXSE41TlUwNkmrmc8enmYIDEAqbwoLKHMBblWNoQZtKV61hDpeWgfjhUmKe40
 8onuIdkentb67d5Q9pxth/DLnEszD1dLleBjadaLHk2oGaYmADCARNCGfn6AUJNajOT8ZRCP8dC
 EmbroP7vuFPyYOf2hK8O2MD6g6ur+YHhES8qIMnn83R7WULv3wIeleKHEmixI3RCr8bx+2572T+
 hmOWr3lw5sZgPwdSJmdOkphGP0WsNX3n4QXZpuK3XxkrdgQoo/fKFPrepiTDYGmRNi8TCnz6wYV
 WXXEKZv9z+idAXD1dskVY4ZFJo25cD2ezaPZk3rk8QVanwTgSBti+RMjatVH8a4H2QgVoXQ6O9N
 1A5gJFqhYqXOge/Q8VZ8m17b2tRL0KVsHeXl+FyS/Gr/tOaw6kLK/gkJezn1V7jPg=
X-Received: by 2002:a17:903:907:b0:2ae:807e:ed28 with SMTP id
 d9443c01a7336-2aeca9588e2mr129819245ad.6.1773693311676; 
 Mon, 16 Mar 2026 13:35:11 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-63.dlp.protect.broadcom.com. [144.49.247.63])
 by smtp-relay.gmail.com with ESMTPS id
 d9443c01a7336-2b062b8d466sm1244965ad.9.2026.03.16.13.35.10
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Mar 2026 13:35:11 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-439b3011be7so3317385f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 13:35:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773693309; cv=none;
 d=google.com; s=arc-20240605;
 b=eyXzJ3pKKNu8i45ndewSRG9JA4PLEV0RBjPR+d3YkloOViE3jg7Ls1TBqtt+O7cVwo
 aEo8fJQ0+7hJqRKhOKkY52iqbcwAqfqvNfFW8jU+r4xDzD2veS+U62hNfobCRoBOw/oQ
 pdqcFPvzfEsuh8ySxTZa4JgV57h/NSnbubs1lYPS2FIVzkO6Aob9uNOS3qfY9BtztJZ7
 aZFB0LkxPa2Sx4R36C5DW6v+CJgWQSVaQA8HgmRGTfDvvNnSutDTyIgoc7ERGBUKj8NH
 hH223zrjFlXMXi4rHaFlQvg56gegOWekNZ3oLaksSXzaNVERULrEgSheJJoRzAxDhvin
 n3Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Y96+P3bhlS1rCYBJCL2EP/mHsZ1Sdzqb26b1pUwJYQw=;
 fh=/yNWDa7G2x6BqvD065wEoEtBPQgnjCGCV2oasxNhZU0=;
 b=B7DEmyqssNouKFMKZiZ6uizcNd1iaodbvgIT0hl2LquXr0506DBQA/FZ0+4+QgkTBF
 E25UchdRDu+r+crUUUvpPnT4mHKLIVk3cjPA5fzmHfeJ9mrLr4avBJjZNFig0u5TIl5T
 tX6i972M8QtqhbJtdw2j6Oe4tCR2UAvXd5tId34yvODErntYGE7QUeN4o2s/MnzxYD+N
 IoXbslBeUIHlEKFLbgyUui7I6hnCkrV3qHuAW4GhHU+Tm/ZkpU+hREHzVoi3TBQqy//r
 etkhKZetVJ8lKgys3V7oNtVFqJUStiMbZiDBJKOgBD/eJ8DAPMGD2Tj85fqoPdzxR8Q3
 wTZg==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1773693309; x=1774298109;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Y96+P3bhlS1rCYBJCL2EP/mHsZ1Sdzqb26b1pUwJYQw=;
 b=dJcq7eGvftpiEchD/Ro5lSKmDJiCeyedqSU8eiT+i19OrALy2sjLSaE9xL7+PK8H+1
 WT6V9SbnN8y1WVyfWikC1o56JF6kQ61b4/UhDSS9KSgGxpmXByx0lAtvyGe8kFN4KHIr
 tZxbuIONB3CnZ9FeluiNfTiEmoiBrxUnUHeq0=
X-Forwarded-Encrypted: i=1;
 AJvYcCUA6Ht5F7i7CIJ0g25PKDCRnVVcAl5XDhNdDl1SWCT/GQzNU+klML1UVFJQNT8m3MGFp+btBVDcmA4wJg==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6000:250d:b0:439:b440:b8a2 with SMTP id
 ffacd0b85a97d-43a04daf226mr25965231f8f.28.1773693308683; 
 Mon, 16 Mar 2026 13:35:08 -0700 (PDT)
X-Received: by 2002:a05:6000:250d:b0:439:b440:b8a2 with SMTP id
 ffacd0b85a97d-43a04daf226mr25965158f8f.28.1773693308039; Mon, 16 Mar 2026
 13:35:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260313222206.778760-1-jitendra.vegiraju@broadcom.com>
 <20260313222206.778760-5-jitendra.vegiraju@broadcom.com>
 <abSXP3gMFQEiC5Lm@shell.armlinux.org.uk>
In-Reply-To: <abSXP3gMFQEiC5Lm@shell.armlinux.org.uk>
From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Date: Mon, 16 Mar 2026 13:34:55 -0700
X-Gm-Features: AaiRm50w76AAv0tqrNyqbBxs9zisrjJFbvYKHonV6ktQNKEkvqexn7CcgoG0Gu4
Message-ID: <CAMdnO-LYAPfyvM4vgmGcZgy-aagHSkP+VDmpRskNU-414j3gnQ@mail.gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Cc: quic_abchauha@quicinc.com, me@ziyao.cc, chenchuangyu@xiaomi.com,
 edumazet@google.com, lizhi2@eswincomputing.com, yangtiezhu@loongson.cn,
 linux-stm32@st-md-mailman.stormreply.com, weishangjuan@eswincomputing.com,
 daniel@iogearbox.net, chenhuacai@kernel.org, john.fastabend@gmail.com,
 siyanteng@cqsoftware.com.cn, sdf@fomichev.me,
 bcm-kernel-feedback-list@broadcom.com, vladimir.oltean@nxp.com,
 kuba@kernel.org, pabeni@redhat.com, hawk@kernel.org, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 ast@kernel.org, wens@kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, florian.fainelli@broadcom.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 boon.khai.ng@altera.com, horms@kernel.org, bpf@vger.kernel.org,
 davem@davemloft.net, ovidiu.panait.rb@renesas.com
Subject: Re: [Linux-stm32] [PATCH net-next v7 4/5] net: stmmac: Add PCI
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
Content-Type: multipart/mixed; boundary="===============0865328172598164584=="
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
	RCPT_COUNT_TWELVE(0.00)[35];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:quic_abchauha@quicinc.com,m:me@ziyao.cc,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:lizhi2@eswincomputing.com,m:yangtiezhu@loongson.cn,m:linux-stm32@st-md-mailman.stormreply.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:bcm-kernel-feedback-list@broadcom.com,m:vladimir.oltean@nxp.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:hawk@kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:ast@kernel.org,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:florian.fainelli@broadcom.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:horms@kernel.org,m:bpf@vger.kernel.org,m:davem@davemloft.net,m:ovidiu.panait.rb@renesas.com,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,m
 :andrew@lunn.ch,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[jitendra.vegiraju@broadcom.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	HAS_ATTACHMENT(0.00)[];
	DKIM_TRACE(0.00)[broadcom.com:-];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jitendra.vegiraju@broadcom.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[quicinc.com,ziyao.cc,xiaomi.com,google.com,eswincomputing.com,loongson.cn,st-md-mailman.stormreply.com,iogearbox.net,kernel.org,gmail.com,cqsoftware.com.cn,fomichev.me,broadcom.com,nxp.com,redhat.com,altera.com,bp.renesas.com,lists.infradead.org,vger.kernel.org,lunn.ch,davemloft.net,renesas.com];
	NEURAL_HAM(-0.00)[-0.380];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,armlinux.org.uk:url,mail.gmail.com:mid]
X-Rspamd-Queue-Id: B06FF2A043A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--===============0865328172598164584==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000a15817064d2a273f"

--000000000000a15817064d2a273f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 4:01=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Fri, Mar 13, 2026 at 03:22:05PM -0700, \Jitendra Vegiraju wrote:
> > +     plat =3D devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
> > +     if (!plat)
> > +             return -ENOMEM;
> > +
> > +     plat->dma_cfg =3D devm_kzalloc(&pdev->dev, sizeof(*plat->dma_cfg)=
,
> > +                                  GFP_KERNEL);
> > +     if (!plat->dma_cfg)
> > +             return -ENOMEM;
>
> Please use stmmac_plat_dat_alloc() - this will allocate and initialise
> struct plat_stmmacenet_data, and as of commit 7a6387dec8ce in net-next,
> will also avoid the need to allocate  dma_cfg.
Ack, will incorporate stmmac_plat_dat_alloc() and further cleanup in v8.
>
> > +
> > +     plat->suspend           =3D stmmac_pci_plat_suspend;
> > +     plat->resume            =3D brcm_pci_resume;
> > +     plat->bsp_priv =3D brcm_priv;
>
> Populating suspend/resume means that plat->init and plat->exit
> will only be called on driver probe (former), probe failure (latter)
> or remove (latter). Please consider using these to ensure that
> all appropriate resources are properly cleaned up in all cases.
>

Thanks for pointing this out. I will check resource cleanup more closely.

> Thanks.
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

--000000000000a15817064d2a273f
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
gccwLwYJKoZIhvcNAQkEMSIEIEVXcjSjz56AI0w+HsGXeUxkTOKzBC+efQ7f15h8z9swMBgGCSqG
SIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDMxNjIwMzUwOVowXAYJKoZI
hvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG
9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAFKLRiMUO18y
a0BAKLhgr2qjeDHvAmd7g/MkO4V2joJ7Uuw+71a0lK2str1PnrliHtxBtcnLjEkypr9kg8UJsCXk
jJkEVaYOBV21HU+6NjLpaxLFWdVA76lEX7ev06oQvqaHpUDAMdErV4fUZ0OLgcb5ZZVnlRkfp5Qt
tBw9JYgUu3eQjGnW4E2Ky90xy347h7IiE9GMB4aMLmrOHxH7lH9n7aOCGWse//hCGmx+Ndz6ZRf+
HLg7aqfN8icTZ/FsoHMnuHAoL1dABftDygbJYMVJxOFss7ozIsk9pVrqN4RME28/iwXspEonsqN1
suZE6y05oullO+na7hNowFV6sMk=
--000000000000a15817064d2a273f--

--===============0865328172598164584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0865328172598164584==--
