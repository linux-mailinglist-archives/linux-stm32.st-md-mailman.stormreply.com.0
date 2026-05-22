Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id III+ELzwE2qmHgcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 08:48:28 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FBF5C6B7F
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 08:48:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A118C87EBF;
	Mon, 25 May 2026 06:48:26 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10CBDC87ED0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 May 2026 06:54:56 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-49040362e4aso8920695e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 May 2026 23:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779432896; x=1780037696;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wJ0C563Ghgv+mwad+zKEpzaeJ9PbuKH0EuvqylaFOXw=;
 b=U5Y8KNBj9Sh291RT12u3NTopFhnSrUVIFxTSbf+VYtPLg+my4oVrBCdRsMJvPBfjFl
 Bmqg9adTKVJSGg/E77G2x1HfD945FjZRTMCc9q5Q24DXGKbX9pYzaRnR3JVpYC+Qgsha
 ndeyHfQ6BwNTFN6b6IztT1wGsKvPaUIzVvHntmSrOCCxRFLBy4KzuesOjJRg1cRb/7Gv
 OOt1g5HWs2xywtULrkBg9wBPHX8DLEUw2wESdPyQRmrlUBI4fWNvR8iVX/9Zda33sMn7
 FtcQC9ca62fi2pfMXRzouF9v2ejNSMgJSkG2tPdVzwC6d5bGwfatqEqfxU6P1xICWaEv
 ESDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779432896; x=1780037696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wJ0C563Ghgv+mwad+zKEpzaeJ9PbuKH0EuvqylaFOXw=;
 b=NqxvRKizEWXKLb5RDH9I5IlWFXdjITe3KZxF3Ox10/+2WiYy1uY7vaTvSanNd0vwaL
 b+2Qc9erd998fjdCBVaIlPBPLw8NAUNf+1yMsHxLvUY0J2qqcQJeByaOwY+MXBRMcoyJ
 93IO/gjnlnRqwdY9kYspZku8L77zksAg3c7VLJA1MGCrkhrtc0K3yqO1la+FL8wJMOvo
 sSPw3ob7Zzw3utJyW5K1zsE8vZiBLEEL5jUW0PdvddCmHXTKti+L8JCb4iBkh0mUWNCo
 TLw4z28k20VMIOGPo1eHoGD9gAO5ik3WG4HdXDI6AB07pIqz+5D5191lZOy4wtDEAaWn
 +FBQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8FDkb5XOc0901ZYIuvTiW1mM0tjZdGIkZPpa3i8Fw1QLv9YJ51QniThcvfsVnge0gQ3XTKdN7C83M4Dw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx0/yWbc1j2WYLttyu5/6IPGaGtQWY5Zy5ZN+NgEXevITwTMdcM
 jBfQqMUxSIX3SEqKf8aKg1qrRCev0SrnYw+Ir1IyFyOvojntouYT8ec1
X-Gm-Gg: Acq92OHAGz98iHy/XKUWJ2wqn66mowgkysBSSbzXmeprCEr6ucVZblzor/by+EhSRwI
 Qa7pKok7LvoycSwKYSJOVM4/hfTl//pU8pLmtdi7xbsGRr6AsgbaiKeNKKOLhQn5ONU5Ye+zQmf
 Xc2KMe3zoJPEaGBCMJWB5DEgvTcAofE5hiHpojnvnc+f08QgLCd9W32S8g3orFeT1xWDldABqlN
 E/16xgQLH+W2NiKYGssZwWXLa/1A06LCcQvyaI317iwX+vqvFmDQ15Bqnh5sm0kb9zVEuNcvGBv
 aOaok9NMv3eP2xiZ9AN1AuDVDKJQstVPc66NF8LMLfXfs+gv/flX2epUMTWNLh61xxMCh2JNEZc
 7WTA5v1s6aHWi070aazszEKHXmG+xg3b+Iv/wqVwjzHl13UrTwhVdUSaVmEGzRXsdzC5EfPHfV/
 tt8NjsTAEfOwJWvafvrkrCluimQ8rlO8VyqKrf3tpGvrIilWQgF7PAMMxY2Q==
X-Received: by 2002:a05:600c:4ecc:b0:490:3a07:c467 with SMTP id
 5b1f17b1804b1-490426cf642mr25318265e9.22.1779432896201; 
 Thu, 21 May 2026 23:54:56 -0700 (PDT)
Received: from INBSWN167928.ad.harman.com ([31.215.251.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490428d4cefsm9693025e9.14.2026.05.21.23.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 23:54:54 -0700 (PDT)
From: Abid Ali <dev.taqnialabs@gmail.com>
To: andrew@lunn.ch
Date: Fri, 22 May 2026 06:54:34 +0000
Message-ID: <20260522065434.6231-1-dev.taqnialabs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2d702678-5b2b-451e-b692-228efcbbefc4@lunn.ch>
References: <2d702678-5b2b-451e-b692-228efcbbefc4@lunn.ch>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 25 May 2026 06:48:25 +0000
Cc: dev.taqnialabs@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: mmc: Remove duplicate
	mmc_rx crc
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[71];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[devtaqnialabs@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:dev.taqnialabs@gmail.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:devtaqnialabs@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.875];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devtaqnialabs@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lunn.ch,google.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lunn.ch:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: C4FBF5C6B7F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 20:44:53 +0200, Andrew Lunn wrote:
> Thanks for the updated commit message.
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Much appreciated.

Should I send a v3 with the Reviewed-by trailer added ?

- Abid

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
