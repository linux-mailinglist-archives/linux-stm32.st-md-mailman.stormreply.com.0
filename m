Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFbbDAG+qWlvDwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Mar 2026 18:31:45 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF0F216440
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Mar 2026 18:31:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 113CBC8F26D;
	Thu,  5 Mar 2026 17:31:44 +0000 (UTC)
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 902A9C87EBD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Mar 2026 17:31:42 +0000 (UTC)
Received: from hillosipuli.retiisi.eu
 (n18ws8cotp5c1dsf-1.v6.elisa-laajakaista.fi
 [IPv6:2001:99a:0:19f:4ce7:0:1157:8c0f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: sailus)
 by meesny.iki.fi (Postfix) with ESMTPSA id 4fRc626652zyVM;
 Thu, 05 Mar 2026 19:31:38 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
 t=1772731900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IIdcmWFjidJR6r6yijbOg5atPdCeq+LdXxOD6ElKnbQ=;
 b=vNv6Wiw4Xvfi089Fq9+E6JNNhi2Y3WR1Jzfwss0xjhX/7G2yJZZYQHoZz9YgAgFIOayfET
 lNoOP5MnaphYFWQVqURtju+aF1rSq7Pr64avVr2C/id7Mw9Cf/rJCyEX/ibXggi5vRM6yq
 uZex9HmZB9dXwtCHOSDz6UpugIwZm4I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=meesny; t=1772731900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IIdcmWFjidJR6r6yijbOg5atPdCeq+LdXxOD6ElKnbQ=;
 b=GkNFEbEgaSmMs7tpq9OaKpiNvpUEkhiAShomlplPZ9KgCQoUfqsJergpyp+3V2Rt1rIlx6
 o1BtqZHo+miimEoMzUbXqJ77um/IcWBWhXf1aef5gLySzMAG7o4ihICa+tWtwaRaN6O+DL
 D7u+6eJbesIl20NAFz/mkv4j2yBUQx4=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1772731900;
 b=Qpjs3xn3xCz6V2Mh2vyntKIo+H83uUw7anamRayaNabMsetmEyZPDGwaloVk7828MPwgux
 kwsOEzJLotnKGG/L6qRItFrqBFyZwucxeQPzK+MLPEq4xE06GAq4IpE0EKQ1nYIZ7d5yfz
 R5BwA2a9kpFeYpfBUsnff7wbQ50XMGA=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 60946634C50;
 Thu, 05 Mar 2026 19:31:34 +0200 (EET)
Date: Thu, 5 Mar 2026 19:31:34 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <aam99usPtkwo9GbJ@valkosipuli.retiisi.eu>
References: <20260106-stm32-dcmi-dma-chaining-v2-0-70688bccd80a@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260106-stm32-dcmi-dma-chaining-v2-0-70688bccd80a@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 00/12] media: stm32: dcmi: stability &
 performance enhancements
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
X-Rspamd-Queue-Id: BAF0F216440
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:iki.fi:reject}];
	R_DKIM_REJECT(1.00)[iki.fi:s=meesny];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iki.fi];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:alain.volmat@foss.st.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:hugues.fruchet@foss.st.com,m:linux-stm32@st-md-mailman.stormreply.com,m:dri-devel@lists.freedesktop.org,m:christian.koenig@amd.com,m:linaro-mm-sig@lists.linaro.org,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:mchehab@kernel.org,m:sumit.semwal@linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-media@vger.kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sakari.ailus@iki.fi,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[iki.fi:-];
	RCPT_COUNT_TWELVE(0.00)[16];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.844];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,foss.st.com,st-md-mailman.stormreply.com,lists.freedesktop.org,amd.com,lists.linaro.org,gmail.com,linaro.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Alain,

On Tue, Jan 06, 2026 at 12:34:28PM +0100, Alain Volmat wrote:
> This series improve stability of the capture by fixing the
> handling of the overrun which was leading to captured
> frame corruption.
> Locking within the driver is also simplified and the way
> DMA is handled is reworked allowing to avoid having a
> specific handling for the JPEG data.
> 
> Performances of capture can now be increased via the usage
> of a DMA->MDMA chaining which allows for capture of higher
> resolution / framerate.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

I've picked the 10 first patches to my tree, I presume the rest are merged
via another tree?

Please cc me on the next time. Thanks.

-- 
Kind regards,

Sakari Ailus
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
