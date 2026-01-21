Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIxVEARZcWkNEwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 23:53:56 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB2D5F1A2
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 23:53:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88D41C349C4;
	Wed, 21 Jan 2026 22:53:55 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 943D6C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jan 2026 22:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769036032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UiEPj0ZcSawildEgR+9wJ/AtCxMbPbzcmfyb7UYIQ4E=;
 b=iHOtLHV1w7oSuPv+8F+UuBYkNIL+S59QcmkP0xKN1x8tnPUz2hkM9BDiW8ESUku4bt3n3V
 7SjcjFWhdZdVwIE75Xlyu/3mmaYW2VXPTgmxbr2Szk2X59tO/1nrg90gCqlT+QtMgxZEZF
 SqqmiRbwXzm/wY8vfNOt0LIgaJMzPk4=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-CJRhIKjoOAeksNBTICw2Kw-1; Wed, 21 Jan 2026 17:53:51 -0500
X-MC-Unique: CJRhIKjoOAeksNBTICw2Kw-1
X-Mimecast-MFC-AGG-ID: CJRhIKjoOAeksNBTICw2Kw_1769036031
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-502aaf2d18bso12606421cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jan 2026 14:53:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769036031; x=1769640831;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UiEPj0ZcSawildEgR+9wJ/AtCxMbPbzcmfyb7UYIQ4E=;
 b=b5hfWKSGRiwfLvPTMDAkRpA0veZ9Mxy7eW/wyMuXzNY+c8+nSg1FwlbNpn0Rypwx9m
 Z3cAL9jQvhx25IKTCGFPFMpOTLKlQjaeA+2canWdmEP19oJKAX7OyEGNk8lTJrnVNA9j
 6KUbr1K0u+Aeiy3d/Svx4YOpObifLI4wnLnTXKFDsZ+FYPv7hE43FjqsMxU4netY8Kxb
 wqlp5roOOlqmmL1F/8v4VrGuSlxrlgH+NZ9OOMHQyt2HDIc9udqnJxXmda/20XtsodWW
 OH5+sU+L6HK8vw9QJcMXOqRxoWnx8pYJ97sTt2O6DermpHVj9KKefUgWRBYY6/hW9OXs
 POjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/l8GA1I6EBoIXrN3XuS51I1NNfYWScVySZ4G8/wxGcQ9IuWVGsW2TzJTHn5exAiPE7UiIQ3QIf33/OA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzBrgL0UAFIynMR7JPJ1XJWzVuFsdLsxe91E/XtuNzAaR+xWON+
 EjVfXc59RTDmj0xEilj8wrCMwFuap6Y31/Whr4uTC8xW9X2VSqGXDdSTD7/jkgdMvBBrkGvNQ59
 anCLNwIPXprPCh9Bcbhx7mH4oSIGZ9u4qfrTKjqKPrKrbdAm38RmUG3DMlRBEnSw2Rm+C0ZP2lC
 zRnxnSdg==
X-Gm-Gg: AZuq6aIWA6y1Fg24XwqhPOn1FS6S6MTmt1v0ivP5l+6Rb6bDlZrtOFY+rMzUB3tOuFx
 cZSWvFdrxqZj1UnYsBf9NdC72NK6lIYnqWgC2VwKbt53h9vm4zgFyJFksBWrwcpQqiXH+UwXIIZ
 2u5h8jnSwmP9sm4GYj+QNbXQ66SjN3sGI7W7B4JBowVD/lJBdxZt5mOXJsWGp+MtICtIZ1HiKS5
 uISfGES/cDj8kse29QkfqKX9EW4ux1YTvhI1VTuBHgjtz8GP9JeLpXMg1wNCZVV29H2xnh1YTCt
 2rl7CjH8F3J/gCNadFOokjDgrtbAV9XgffieOOaF4jGBOLX44RvHOzdlMW1EFFO0bpXwUxbB8vV
 3IPDrOKjc
X-Received: by 2002:ac8:5fca:0:b0:4e7:2210:295f with SMTP id
 d75a77b69052e-502d84b0ca5mr87957051cf.13.1769036030773; 
 Wed, 21 Jan 2026 14:53:50 -0800 (PST)
X-Received: by 2002:ac8:5fca:0:b0:4e7:2210:295f with SMTP id
 d75a77b69052e-502d84b0ca5mr87956771cf.13.1769036030338; 
 Wed, 21 Jan 2026 14:53:50 -0800 (PST)
Received: from redhat.com ([2600:382:8125:73a8:e201:8ac3:bd7d:6acd])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-502a1f1abb9sm117138811cf.30.2026.01.21.14.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 14:53:49 -0800 (PST)
Date: Wed, 21 Jan 2026 17:53:44 -0500
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Message-ID: <aXFY-FxqeBv4BsHd@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k_mzyW1W8TACgf5tEO8bTfUDNRgB_W_fKe1IPxjVcLs_1769036031
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 Shan-Chun Hung <schung@nuvoton.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, linux-clk@vger.kernel.org,
 linux-rtc@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Chen Wang <unicorn_wang@outlook.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Orson Zhai <orsonzhai@gmail.com>,
 Keguang Zhang <keguang.zhang@gmail.com>, linux-sunxi@lists.linux.dev,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Simona Vetter <simona@ffwll.ch>, Jacky Huang <ychuang3@nuvoton.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-actions@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 Vladimir Zapolskiy <vz@mleia.com>, sophgo@lists.linux.dev,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Chen-Yu Tsai <wens@kernel.org>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Sean Paul <sean@poorly.run>, Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Inochi Amaoto <inochiama@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 linux-mips@vger.kernel.org, Jessica Zhang <jesszhan0024@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Takao Orito <orito.takao@socionext.com>, freedreno@lists.freedesktop.org,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Subject: Re: [Linux-stm32] [PATCH 00/27] clk: remove deprecated API
 divider_round_rate() and friends
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[redhat.com : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[redhat.com:s=mimecast20190719];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mturquette@baylibre.com,m:sboyd@kernel.org,m:alexandre.belloni@bootlin.com,m:baolin.wang@linux.alibaba.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:schung@nuvoton.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:linux-clk@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:samuel@sholland.org,m:zhang.lyra@gmail.com,m:unicorn_wang@outlook.com,m:jernej.skrabec@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:orsonzhai@gmail.com,m:keguang.zhang@gmail.com,m:linux-sunxi@lists.linux.dev,m:piotr.wojtaszczyk@timesys.com,m:simona@ffwll.ch,m:ychuang3@nuvoton.com,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-actions@lists.infradead.org,m:mripard@kernel.org,m:vz@mleia.com,m:sophgo@lists.linux.dev,m:abhinav.kumar@linux.dev,m:robin.clark@oss.qualcomm.com,m:wens@kernel.org,m:michal.simek@amd.com,m:linux-arm-kernel@lists.infradead.org,m:sean@poorly.run,m:neil.armstrong@linaro.org,m:lumag@kernel.
 org,m:sugaya.taichi@socionext.com,m:inochiama@gmail.com,m:andersson@kernel.org,m:linux-mips@vger.kernel.org,m:jesszhan0024@gmail.com,m:vkoul@kernel.org,m:mcoquelin.stm32@gmail.com,m:orito.takao@socionext.com,m:freedreno@lists.freedesktop.org,m:afaerber@suse.de,m:zhanglyra@gmail.com,m:jernejskrabec@gmail.com,m:keguangzhang@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[bmasney@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[47];
	FREEMAIL_CC(0.00)[bootlin.com,linux.alibaba.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org,nuvoton.com,somainline.org,gmail.com,sholland.org,outlook.com,st-md-mailman.stormreply.com,lists.linux.dev,timesys.com,ffwll.ch,kernel.org,mleia.com,linux.dev,oss.qualcomm.com,amd.com,poorly.run,linaro.org,socionext.com,suse.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[redhat.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: DFB2D5F1A2
X-Rspamd-Action: no action

Hi Stephen,

On Thu, Jan 08, 2026 at 04:16:18PM -0500, Brian Masney wrote:
> Here's a series that gets rid of the deprecated APIs
> divider_round_rate(), divider_round_rate_parent(), and
> divider_ro_round_rate_parent() since these functions are just wrappers
> for the determine_rate variant.

I sent you a GIT PULL for what can go to Linus for the upcoming merge
window from this series:

https://lore.kernel.org/linux-clk/aXFYU324yQ6uBmk0@redhat.com/T/#u

Thanks,

Brian

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
