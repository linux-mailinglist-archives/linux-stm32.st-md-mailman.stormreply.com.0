Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHrtCIcZsWllqwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 08:28:07 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA0625DEC7
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 08:28:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C451C9008A;
	Wed, 11 Mar 2026 07:28:06 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4020C32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2026 18:40:51 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2a9296b3926so102507545ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2026 11:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773168050; x=1773772850;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bjFZ9oZWWc3RZ4UdO5rq+AZbr7uPDX73K58gh1+yuH0=;
 b=Gu56ApIXsrDVmizkT6/jb5n2ZmdqAVfMroZwwyyEDAw42FpAz4PqVWDieRxJDQQCtq
 8oq18ytMBgBDVuX75WTttymAPvMw8UM22VE6HfYMIy30IocM7RefebVvKWPwmRVaPurU
 Ks/U6ZD5lqH1u3yFalCtxVKq6UeeWTmmTdW6HbwDPVxz73D68nZr0NcQy9h8E39mrVfv
 UiDrBjfWeb4H8X2mdy94IAibx0nT9LgwF2enXzofSd5yTazqNRszz/xDDJpgE3vFwN82
 4oyGlc2lB885MfTRRhVKELL2RefPXWvPD0LuKH+ZAx/0icA8buXamw7+Kwd0B5Yw3yI5
 Qi8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773168050; x=1773772850;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bjFZ9oZWWc3RZ4UdO5rq+AZbr7uPDX73K58gh1+yuH0=;
 b=KM5dKUK9R4qxozarCy5qWvZtSKV+weyRXwu/MCCoLXjLC6l0BZoGJBB15CCrRb1hnm
 CBDkAIsyF33M34qoX97Cc9gwhj7UbE7anzsIbZdYzdvu0oNyAQ3hJ97ju9K4vzYzPAll
 kSGgMigUSkEHUndnlzYHaJ6ELovsXezBsxj6JBKsJq1BdMzY9UULvDoN0DIWEmOtRd9s
 NQ+Wx4TTXdNH/dPPW397r2+XU+BFs8i/+DlLfyf+SsXPk3X14Im2M/XdJbxfFyIdChaq
 5bS/I3wphTTkpSnv+JHREtvVf7wVko7oyDOay6T9yLC5RC2NXrjF9UdCy0es687PnyqO
 DB4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV96w0W7YMj9hCtt8kFIQtWOIRYIqPyA3Qho3eE4a5AnAnb6G8mdYkyDHmpGcuPzaUXQByPtCAjMTruFQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy6I0a7RziHUPtGoTtMXUpV100V3dmfbaTbBm/Xo3f2KWI5lpy0
 eluRl0nhH71aZ31s8jiVQCULkHTn0foUQ0WKHNBW7NtguDOZ3LyNQXdA
X-Gm-Gg: ATEYQzy+1cFjIV2Gos2UzchHbctVphHmtiwF9XA+T9Hze1Ffnw5WYz2WUEUmSnxuPXQ
 aOPz4PM5hxxu2uxwmC1GssBhJU026IAk+NA/jI8nok2SuvIFbLG2wbapet4nSQaQ9Haq0rsjtua
 i5Jo4INPN4aAWiPcG4bEObk2lgySFgJ7ll7GstusnlQlVGnrQ3p198kJEmPeRbdUK7vXslKT7PJ
 NfsbK6YsT2EM2t2jVUW92feovvIJR2DTgxOpVnCde3ITLpA7Rg5sZ3ENT5wr8mzIVf0R2HxQqLo
 GMPDC84XcPiEsrPzg9CHBVYAtOAL2QMC/EntAzGCMvWKINwJvD4l4E4cGq1hLJVZdmUA1ifX2eW
 MMOpXtOL08tS7uvFnt8t6QAWWgbrvjNax4DfN9NMqM+LUgl4UdIoQDpKv/kNnKpITvxnl/TjvjC
 ZEH9e4T5w1aj8efhwq+4SNgJd2sxDOGftWq0Yohl3NWqUplw==
X-Received: by 2002:a17:903:28c8:b0:2ae:5671:7071 with SMTP id
 d9443c01a7336-2ae8252cf0fmr96662285ad.43.1773168050081; 
 Tue, 10 Mar 2026 11:40:50 -0700 (PDT)
Received: from google.com ([2402:7500:a44:85b:2953:97d3:b283:95c3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae83e58592sm220535625ad.14.2026.03.10.11.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 11:40:49 -0700 (PDT)
Date: Wed, 11 Mar 2026 02:40:36 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Philipp Hahn <phahn-oss@avm.de>
Message-ID: <abBlpGKO842B3yl9@google.com>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
X-Mailman-Approved-At: Wed, 11 Mar 2026 07:27:23 +0000
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
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 apparmor@lists.ubuntu.com, linux-sound@vger.kernel.org,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-omap@vger.kernel.org,
 sched-ext@lists.linux.dev, cocci@inria.fr, linux-nfs@vger.kernel.org,
 ntfs3@lists.linux.dev, linux-s390@vger.kernel.org, v9fs@lists.linux.dev,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-security-module@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 linux-modules@vger.kernel.org, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
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
X-Rspamd-Queue-Id: BDA0625DEC7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[visitorckw@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:phahn-oss@avm.de,m:linux-hyperv@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-sh@vger.kernel.org,m:samba-technical@lists.samba.org,m:dri-devel@lists.freedesktop.org,m:linux-mips@vger.kernel.org,m:gfs2@lists.linux.dev,m:linux-mm@kvack.org,m:linux-sctp@vger.kernel.org,m:target-devel@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:linux-phy@lists.infradead.org,m:linux-clk@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-cifs@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-rockchip@lists.infradead.org,m:iommu@lists.linux.dev,m:intel-wired-lan@lists.osuosl.org,m:linux-arm-kernel@lists.infradead.org,m:linux-input@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-media@vger.kernel.org,m:dm-devel@lists.linux.dev,m:linux-pm@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:apparmor@lists.ubuntu.com,m:linux-sound@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-gpio@vger.k
 ernel.org,m:ceph-devel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:sched-ext@lists.linux.dev,m:cocci@inria.fr,m:linux-nfs@vger.kernel.org,m:ntfs3@lists.linux.dev,m:linux-s390@vger.kernel.org,m:v9fs@lists.linux.dev,m:linux-usb@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:tipc-discussion@lists.sourceforge.net,m:linux-modules@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:bpf@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-erofs@lists.ozlabs.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[54];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[visitorckw@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	NEURAL_HAM(-0.00)[-0.971];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email]
X-Rspamd-Action: no action

Hi Philipp,

On Tue, Mar 10, 2026 at 12:48:26PM +0100, Philipp Hahn wrote:
> While doing some static code analysis I stumbled over a common pattern,
> where IS_ERR() is combined with a NULL check. For that there is
> IS_ERR_OR_NULL().
> 
> I've written a Coccinelle patch to find and patch those instances.
> The patches follow grouped by subsystem.
> 
> Patches 55-58 may be dropped as they have a (minor?) semantic change:
> They use WARN_ON() or WARN_ON_ONCE(), but only in the IS_ERR() path, not
> for the NULL check. Iff it is okay to print the warning also for NULL,
> then the patches can be applied.
> 
> While generating the patch set `checkpatch` complained about mixing
> [un]likely() with IS_ERR_OR_NULL(), which already uses likely()
> internally. I found and fixed several locations, where that combination
> has been used.

Thanks for the patchset. However, I think we need a explanation for why
switching to IS_ERR_OR_NULL() is an improvement over the existing code.

IMHO, the necessity of IS_ERR_OR_NULL() often highlights a confusing or
flawed API design. It usually implies that the caller is unsure whether
a failure results in an error pointer or a NULL pointer. Rather than
doing a treewide conversion of this pattern, I believe it would be much
more meaningful to review these instances case-by-case and fix the
underlying APIs or caller logic instead.

Additionally, a treewide refactoring like this has the practical
drawback of creating unnecessary merge conflicts when backporting to
stable trees.

Regards,
Kuan-Wei
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
