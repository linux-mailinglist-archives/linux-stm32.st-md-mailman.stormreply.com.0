Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBh1CXIxDmrj7wUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 21 May 2026 00:10:58 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B452F59BCC0
	for <lists+linux-stm32@lfdr.de>; Thu, 21 May 2026 00:10:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5BFDDC87ED1;
	Wed, 20 May 2026 22:10:57 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5664C01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 May 2026 22:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779315055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WUlhTj/LDnGR8NwnkPfh/TBbgWAfcMJHYKZWXxRTj+o=;
 b=CwdgPJI5enHFtdkCsS5ZCwZJeFbYn3T6H7GUMjBbAFcLoy8nZP6+3CvhsLhYdbqQAGJO6R
 f22Mztnmd96EzIewK0bWP5K4xNZSg83TLmFdsJOD+NyX8KP+2c5kndrxWTuiVpJ8rXBg5e
 oj3JMSLHvcJdX3QiC0jmAYb1MQhtoLk=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-hue_Oc0bMmmbUhCJAozgiA-1; Wed, 20 May 2026 18:10:54 -0400
X-MC-Unique: hue_Oc0bMmmbUhCJAozgiA-1
X-Mimecast-MFC-AGG-ID: hue_Oc0bMmmbUhCJAozgiA_1779315054
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-90fc64a47edso1183481985a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 May 2026 15:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779315054; x=1779919854;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WUlhTj/LDnGR8NwnkPfh/TBbgWAfcMJHYKZWXxRTj+o=;
 b=ErrLns5zcLBCkugK5Ql5Ai48oMbHAEmTi3qUCRHbMVe+VK+ddvmUnCRJ869l6VVKtO
 akHmOluQDivo5AMglk3fLmPmnjDftUQBAG1AtPqPxSKekdPrOp0zswbJCLxDsM8/k8ds
 AsQFhwJ4/MA7wxXBTMUgo5wZ0WhKgLGegUeZQOxImB8ezk8tUiC71reCFhFkaoc6MabN
 mcuVAMGOhNjKV2WvjoPgw5pxyV4G7J/hQi6DBqe34GN+Afjs470LFKrAN/90mK0p8xmf
 z8zkU1JJkhMNdcyI9UaaRnVCTCf/bg5WcpqgKp7HPXQfzhh1BnnO3+6FsSPtlDfUGr90
 gpew==
X-Forwarded-Encrypted: i=1;
 AFNElJ+8Clt97g94sRALq6cN4qPFnIIdOq8gLbg7JsVBG15EeqnLBi8vtWApWAdrDUPG56HE8ygZBo+Gs4Favw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyqXrtsykq/yAywCDUYwPwOgLepgpHRdMf7I9hkO3vI81VrzKS1
 JCs3AVQc37prn63IGBXTAkLv+KzGBQnfUouQ9zgTeO6wBeiJ0H5m3Ke5ERLTjL9dukrm7M+2B5T
 JKNZUghee/FIilg7iNNvNqddu3GbqLCt+U8Qgcl7NvykkPTKOi1Watru5pvNoVgaD1IWaMpJe+n
 6Qkl691A==
X-Gm-Gg: Acq92OELkEJkmTB5a6vTr9PvofODEfYqozIHAb37ZIvW5Pq3cUnfY53Fhg91GJc1E4l
 i6nDcP1RrX+m3s35I2uiDrA2gR1uV+2yVH5mMSwK8Bdyj6mbi6XQP7z5H2auQHar8TjYDRRc/Ee
 ppDjDbk/Huzw1H5DOeLR9DMaVmajiaQdBjhPrTas8O2mZuLv07pL7lPiPlaA8U5p1I9ylU7PtAu
 eQ2Wtw/XJxk63EHUUATnecLJ/d25w1Re5HHCnXopGd+VVJE6m3Up4urYRMNdbjWY1dkOp7AGvtD
 uYLM0+RR5Did84cdmHX8qvXVhbocPJMBILGW3/ixJmoOIHnaR5xlyMktAyMXT0gxUYVpEtzaZ6W
 i3F7Gjk/q5Qxw9mYbTGSvgCI3uCU=
X-Received: by 2002:a05:620a:370a:b0:8cd:8938:f000 with SMTP id
 af79cd13be357-914a2ce9f9amr16389185a.28.1779315053909; 
 Wed, 20 May 2026 15:10:53 -0700 (PDT)
X-Received: by 2002:a05:620a:370a:b0:8cd:8938:f000 with SMTP id
 af79cd13be357-914a2ce9f9amr16384985a.28.1779315053518; 
 Wed, 20 May 2026 15:10:53 -0700 (PDT)
Received: from redhat.com ([69.43.42.202]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-910bab3a207sm2240740085a.15.2026.05.20.15.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 15:10:52 -0700 (PDT)
Date: Wed, 20 May 2026 18:10:51 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Message-ID: <ag4xa-WmnGti3naD@redhat.com>
References: <20260519222639.34508-1-rosenp@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260519222639.34508-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oWOqcAE9TGn7KWNZvgAJdxzNMov4BSdaZ6rYwVmhbC0_1779315054
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>,
 open list <linux-kernel@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Alok Tiwari <alok.a.tiwari@oracle.com>,
 Michael Turquette <mturquette@baylibre.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-clk@vger.kernel.org,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] clk: stm32: add missing bitfield.h header
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
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[redhat.com : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[redhat.com:s=mimecast20190719];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rosenp@gmail.com,m:nicolas.le.bayon@foss.st.com,m:linux-kernel@vger.kernel.org,m:sboyd@kernel.org,m:alok.a.tiwari@oracle.com,m:mturquette@baylibre.com,m:linux-stm32@st-md-mailman.stormreply.com,m:gabriel.fernandez@foss.st.com,m:mcoquelin.stm32@gmail.com,m:linux-clk@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER(0.00)[bmasney@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[foss.st.com,vger.kernel.org,kernel.org,oracle.com,baylibre.com,st-md-mailman.stormreply.com,gmail.com,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: B452F59BCC0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 03:26:39PM -0700, Rosen Penev wrote:
> It seems some ARM header includes this and the build passes there, but
> nowhere else. Note that the driver has COMPILE_TEST in depends.
> 
> Fixes: 37ae8501cdb0 ("clk: stm32: introduce clocks for STM32MP21 platfor")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
