Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGCLCD+4smmYOwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Mar 2026 13:57:35 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFF7272121
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Mar 2026 13:57:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A94BC8F28F;
	Thu, 12 Mar 2026 12:57:34 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E12DFC8F28C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Mar 2026 12:57:32 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-8cd80f56b27so89289385a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Mar 2026 05:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1773320252; x=1773925052;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=J1SF1XBHkHR0j7NZVucv0LxpGoGXl67PUefLsfwpAbo=;
 b=QEcaTa+k+TaB2gT/2iq4X4YifNiHpf0+mbckpeX2U1eh1eFGcbczV2BWbtRQ4bf7+2
 OWseGpDSvw9hhOQlP43OEypAiaQE3i77fPrKcBA7bpiYLDHyB6fjA/gBlRPyHsRh+lhP
 iYNezNOw4B/wTdAVp6txp+sYDmJGCsZku3P6lANnKf08kMW+e55BcoqrGjnkh+QbGv6x
 3Alq/CUL0FGNkHmZGmkcqDLRA3VJWR3D2N3rAMjauyEyby40rwF+tQemxbBQVhdcObK5
 XstOcbu2oix8Zq6qFpb9DNfffdsk1n8zH13wMxjMSRcxZSA4TkT1sOIYEZfpQEXRr0lN
 m6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773320252; x=1773925052;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J1SF1XBHkHR0j7NZVucv0LxpGoGXl67PUefLsfwpAbo=;
 b=CUd/oqY+pQUE7EVaunUs7aX/INKy9OWhzn1d7zf2RzLFTgFo4aZEkNMt8Fpz7RXsBR
 wibkAk36kg7kDSbaKY/0qhkhF3OGtatgAnmEwZe6XOOXBE0fiaSpDtWJf1doOnMaV1kS
 3jAApaLN0/qv2KhcEVN8zO61RK+L3jw/+PG6tQhvhfdXsIVlVs1ZIbR5lXz0IEEnSu0e
 sn8sNpT3bOYDf4ghDKDwS1HvndEagzV6yYmn0GBrU3ZGEtNesZ1tWQNChijhi91P3eut
 PszU+9NB5zpA3FLiJZ5wy77vQQ1HoVVyOnA2u2nK+nhPJNdZKA1zW2EqF0ZCMIcmz/Z+
 gp1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpVOlihZjJkJ8u2LNTOjDBvicgbt3XFk7vdgsOvGP5oAY0r1Qy+qeXvrsYOOdoRSgknzIopXMKpXurdQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzprXZJtT89CgnmBqjaAAxCFz4JeYBoWYMLaZKilPzlTN1k/0wr
 LvW/02rsMHzhWOQK1ErwBP6KSMY22CkrUv1iSzIFFKuQYaKXKiMf5Ge21q+LwBlljeQ=
X-Gm-Gg: ATEYQzzOVaLoEO65vEaeyuPGBlN6SHkog3GzN98I3rKgoPuAhR3/d1C2aVkRRDnwIKA
 dlLlTbEYMLGBCvGZkdnnkxeSGe54g9o2g6g9jOg0B4n5LKPsMU312AhS9DTGYYZaKSfA0RlFmd/
 rjVRjOiNvSVySg1a0S3dkoi0oolwF2Ozvf3MJhCSPxUc4seUHloD4jwla3Wn0l5lglE/2seWi4k
 Qt+2A8rTcSmF6mX853gpOUbIPzly6WhHWOtNY4iDSdAxp1ozTaqAY0sfRdm9GNfw4uPJRwI2qjP
 6teDZ3aTMEdZb8zVMpjs5eHcixgMvqZh7nQlinvEM9/5NwPWgglB+At023SgdxdNYMTil691JFW
 +ChJJgq9xIm5a9m8Jv/ri4zz4lzPG4m6aWSKUTzWH1bQedgw8YgQVJ026FWFoppkbTlhgVNSJ9k
 cwrz+YovwVFwhUptOJwtAyzjJXbOZmZMIwIE+UHcyq7+R1Cuysyatl2puoIrkLPm431LZk7MkMx
 QgJAzA+
X-Received: by 2002:ac8:5d4d:0:b0:509:cbc:127b with SMTP id
 d75a77b69052e-5093a1bd58fmr77950521cf.60.1773320251710; 
 Thu, 12 Mar 2026 05:57:31 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-89a65bd318fsm33341196d6.8.2026.03.12.05.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2026 05:57:31 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1w0fbW-00000006fKD-1POa;
 Thu, 12 Mar 2026 09:57:30 -0300
Date: Thu, 12 Mar 2026 09:57:30 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Message-ID: <20260312125730.GI1469476@ziepe.ca>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <abBlpGKO842B3yl9@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <abBlpGKO842B3yl9@google.com>
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org, linux-sh@vger.kernel.org,
 samba-technical@lists.samba.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, gfs2@lists.linux.dev, linux-mm@kvack.org,
 linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-cifs@vger.kernel.org, linux-scsi@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-rockchip@lists.infradead.org, iommu@lists.linux.dev,
 intel-wired-lan@lists.osuosl.org, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-media@vger.kernel.org, dm-devel@lists.linux.dev,
 Philipp Hahn <phahn-oss@avm.de>, linux-pm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com,
 linux-sound@vger.kernel.org, linux-block@vger.kernel.org,
 linux-gpio@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-omap@vger.kernel.org, sched-ext@lists.linux.dev, cocci@inria.fr,
 linux-nfs@vger.kernel.org, ntfs3@lists.linux.dev, linux-s390@vger.kernel.org,
 v9fs@lists.linux.dev, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-security-module@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-modules@vger.kernel.org,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 00/61] treewide: Use IS_ERR_OR_NULL over
 manual NULL check - refactor
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
X-Spamd-Result: default: False [3.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[ziepe.ca:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[ziepe.ca];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:visitorckw@gmail.com,m:linux-hyperv@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-sh@vger.kernel.org,m:samba-technical@lists.samba.org,m:dri-devel@lists.freedesktop.org,m:linux-mips@vger.kernel.org,m:gfs2@lists.linux.dev,m:linux-mm@kvack.org,m:linux-sctp@vger.kernel.org,m:target-devel@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:linux-phy@lists.infradead.org,m:linux-clk@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-cifs@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-rockchip@lists.infradead.org,m:iommu@lists.linux.dev,m:intel-wired-lan@lists.osuosl.org,m:linux-arm-kernel@lists.infradead.org,m:linux-input@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-media@vger.kernel.org,m:dm-devel@lists.linux.dev,m:phahn-oss@avm.de,m:linux-pm@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:apparmor@lists.ubuntu.com,m:linux-sound@vger.kernel.org,m:linux-block@vger.kernel.
 org,m:linux-gpio@vger.kernel.org,m:ceph-devel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:sched-ext@lists.linux.dev,m:cocci@inria.fr,m:linux-nfs@vger.kernel.org,m:ntfs3@lists.linux.dev,m:linux-s390@vger.kernel.org,m:v9fs@lists.linux.dev,m:linux-usb@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:tipc-discussion@lists.sourceforge.net,m:linux-modules@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:bpf@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-erofs@lists.ozlabs.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[ziepe.ca:-];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[55];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: ADFF7272121
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 02:40:36AM +0800, Kuan-Wei Chiu wrote:

> IMHO, the necessity of IS_ERR_OR_NULL() often highlights a confusing or
> flawed API design. It usually implies that the caller is unsure whether
> a failure results in an error pointer or a NULL pointer. 

+1

IS_ERR_OR_NULL() should always be looked on with suspicion. Very
little should be returning some tri-state 'ERR' 'NULL' 'SUCCESS'
pointer. What does the middle condition even mean? IS_ERR_OR_NULL()
implies ERR and NULL are semanticly the same, so fix the things to
always use ERR.

If you want to improve things work to get rid of the NULL checks this
script identifies. Remove ERR or NULL because only one can ever
happen, or fix the source to consistently return ERR.

Jason
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
