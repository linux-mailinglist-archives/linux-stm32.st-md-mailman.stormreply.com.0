Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFh2HCJn+mnwOgMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 05 May 2026 23:54:42 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DD54D41C5
	for <lists+linux-stm32@lfdr.de>; Tue, 05 May 2026 23:54:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41AF6C055F4;
	Tue,  5 May 2026 21:54:41 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com
 [74.125.82.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC76BC36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 May 2026 21:54:39 +0000 (UTC)
Received: by mail-dy1-f174.google.com with SMTP id
 5a478bee46e88-2ef38cf04f0so5965005eec.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 May 2026 14:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778018078; x=1778622878;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Qn2gN9TOXcgav3hEevfmLoUHUeCTTlNmOyy5YzrGBk4=;
 b=Qa10yDLJTESJqdNy86zjcswjqwGk9z9XoefhBOPGc3Vkl0U88kHfJ63LLd3JUnydYW
 Lbom8WVNr9VXDWoEfg7dfTRd/4mCgOOsCd0prbYxY1tlVv0PCe+xsQC7PhiDIeJKrQ15
 hxj9IniZQcEW6etV+MHTHN0QZD4L5yiHhX/Yidb5Wkpk/5KdFxQNaBNEkdgqtFCRi/69
 7kXL2x+UybUKoSHB9/Pj3zx4r62PB/BJfaOjWz+skUYZqVpZhqYbwD4vlAqqa7aAJk02
 vlFo6MOOTIzO9uKimOvZRXkSfmN5tbFfb1CGXhR18cJUx7euGhWDvClpgUzkZ08p5KWI
 ZRMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778018078; x=1778622878;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qn2gN9TOXcgav3hEevfmLoUHUeCTTlNmOyy5YzrGBk4=;
 b=BXErfJGJPCZWuGr1rZ6ZDTa5oZhK7lyXzO3704Cd+oFB8cdQ/hpKmCD5U04yL8gNqx
 qt54rkozwXEdMdiHFlkG9DwgYBUIQ4MYX5NjfffDr48eP8ILfKKtZPy4fcAs1MeJFwxE
 l3f0kE7a5z3Y9CLRNuN5dcWAbTbzfP9Dt3F39c4sL3wSoJrVHoKPKkZJnkCJmsx/Ir+K
 mfvACGbdHVW5hKg0yfLVb/SiIX0jRKc0ZEbDuqnkJAkm/uanB8/4bq26HXG+gQNmdoPU
 j47mJVS/raO0XDiTb1K9nesC+SdDQTsXZ2rw2j1LAMCndLkBhzVTsmInbDqcdD1j8WbG
 PSVw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/y60kbyxJQGDPlJQxF0L/74FxKJYObRtutN9xu4li7TCAiRztG7KisxWYtUVnDj/z4jeo7Gll+V0GktQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz7LKa/qNOogzvWDdD7Tf1Fbwuv7CmHBeoN3DWRL//4UaxBYzvL
 jCPjBIP1taHq91Kqvu/PVQpYEvR4+PWvKtLeVG0vrN9c5aihMIf4vTL2
X-Gm-Gg: AeBDietW++tGA808dPHzBsp4E0b5SU+KVHdmnA3B27PuHcre86hLSyMHrIOLxbrW9qu
 dPlS1A3MI2SecKWonP1OqKfYQZeyHNFAWmzmTDzBiZC0+g8eF3UxUj5HLA4AUSR55+jtgVbWPlN
 apMaeT8e9ZRXzV8dEIyfObIGDhhdnbQwIKraR4nrpWKlUQZLqjdXtC4TWfG+Q+2lepKZFZtH1ad
 Ssjub9Pg1WxL8N+NoYeclxguYLx2S5gMXyI4KyNbCjKw2t7eVjBbAWZbOxcIG8kEaFnZRbC8tlR
 BFOsPI7AClPComlIM/Bk/D7QHaE/oPUcZuEnFSArgYGNEdHpy0gmqTZ5NTtQr4uXFDK+SPFmLFH
 SGvacbI/sMLsZ0lvSpD1uyet6nEZ3HiZFyAjqN3uCtLsXk4ObT8EbXUEGdSq6sWBToV1K2IXqr9
 yXAxJn6uJfM448nrskEoxRi+PTOPtNVhVkEfq80KYqnHVVf7AuvbtM2e41kl34QW7DF42z8ipzv
 Js=
X-Received: by 2002:a05:693c:8110:b0:2d9:32c8:2b69 with SMTP id
 5a478bee46e88-2f54a39074amr415753eec.28.1778018077853; 
 Tue, 05 May 2026 14:54:37 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:94ef:a6f3:2c96:2d58])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2f56cec763fsm722870eec.4.2026.05.05.14.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2026 14:54:37 -0700 (PDT)
Date: Tue, 5 May 2026 14:54:33 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Message-ID: <afpmQKJilpgDqrpJ@google.com>
References: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 Petr Hodina <petr.hodina@protonmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-input@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, phone-devel@vger.kernel.org,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 00/11] Input: support for STM FTS5
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
X-Rspamd-Queue-Id: 04DD54D41C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:konrad.dybcio@oss.qualcomm.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:rydberg@bitmath.org,m:krzk@kernel.org,m:linux-kernel@vger.kernel.org,m:petr.hodina@protonmail.com,m:mcoquelin.stm32@gmail.com,m:linux-input@vger.kernel.org,m:krzk+dt@kernel.org,m:phone-devel@vger.kernel.org,m:konradybcio@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dmitrytorokhov@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.976];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,vger.kernel.org,bitmath.org,protonmail.com,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]

On Thu, Apr 09, 2026 at 12:15:43AM +0200, David Heidelberg via B4 Relay wrote:
> Used on various phones. Minimal viable driver.
> 
> Includes device-tree enabling touchscreen on Pixel 3.
> 
> What is missing:
>  - switching between AP and SLPI mode (to be able to wake up phone by touch)
>  - firmware loading
>  - anything above basic touch
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

Applied #1 through #8 (#5 with minor edits). 

Thanks.

-- 
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
