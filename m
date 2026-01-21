Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNlZAzIvcGkEXAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 02:43:14 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A63294F454
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 02:43:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5AA39C3F944;
	Wed, 21 Jan 2026 01:43:13 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DEA0C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jan 2026 01:43:11 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-34f634dbfd6so4582141a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jan 2026 17:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768959790; x=1769564590;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AkhwBkoPexo6KnbInk5yJ8qfwJ3nLbjN4I2ZMj09FO4=;
 b=JJz2IyKGMwk8nRIjRv1ABRp/WwZOlAn49FPil/R1OyInBBvPR8Lm7C+jP8Z4m6o8Ac
 OAGl+wQa9YSeVnvhBfM0yv+lEdCOzE+wAf1bIOLUmFjWnH6OH14FHJZ8//9gAfeqBbXu
 Nrncz1lNexykUmPD8vx7aWCecRHrbwp91BAebpI/2gPIfx8kYE/6vErdpVaTzFo4/4zh
 rXPR3/qR85ELZrLamYhJAI16cKkcAO1s5/JVmMsrWbiMEs3mIQkGcMsw3xtfO6lrGUvo
 EaHH2x31YLh0XAVAKhIqW9a67KIqGEWyPIc00Tko4Opl0/nZrd7LPmgChUBD47WbZ05V
 LmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768959790; x=1769564590;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AkhwBkoPexo6KnbInk5yJ8qfwJ3nLbjN4I2ZMj09FO4=;
 b=uv2ijntgk4qWWET0cS8xkfgq32rmYH98oN85xv9Ykgc4j7EYhxbYO4d6gHDcLud559
 /zhVZEu3GzH4YTGcbkbAFMRs1/h3wKwiwod3CZPpbCtqqs9CK2cMGFCZcOAqrtDGDwxS
 93amXMDohlRyeHya82j0wvlG9+VlGfqUu4RhkKz2yXTdVQY0cbH6dzZtMqMG1fstvWPB
 hqxRvB44SGbgE0YZq2lKKnuNyfS9VTMR5d81yeBQqiRvl+Z72Poq1VLF60q3MxzsfY2j
 yT4XYyVqZzgTXGbgCKWFj/soKpjiaSFMF6oyanixZM+5WdSMCm9NDh94GE3WJip42ugL
 e67w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWequrM86GpEURdSVTZydX5ExWuXLHzVLQZmEsIYdYolvZ0/y28meX/+9vk1K+DOYExA0ZlmnUz7pcttQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwS2Eo+J+2tw2Vu7rNxEls0SrVsrl8omdEl3sRZ5JQAfMCsTw9z
 6DuzTzWwDtgD4mK2WWKStCrnRRZpmD2g1aOR6iKQ1Hfj7bDP6w/+AczC
X-Gm-Gg: AZuq6aKkZiqrH9HFgcsNg2RwlLkoGzlBZXNaGrNgEAW6RIWZ8xBcfcjaRYgzwTyhM6w
 lkqPlRjKOVxEpenEJcwMR0rZFCDiQme7Ihih4w8ZnEnK6gjNdIK9xoAPvlctXndIDgDZTCELc6U
 aK2G+dYkmY76+hsoV76Amzanv2C/2SnJZ5Src4XBHOCxGBxDEzhEPIJV28Mx4MQy26YSgXPY4Nz
 YI+XaXs0Sdk87EHmXZxjgsSj2RR4t6g/aW+aX4wcQQnpVi69ZPkGd1fg+XKov0jJZIqmvzZRWT0
 A1H+8131cQsG86tzdAWbx6Bqhp3ogekvHtKmTMvJntoKAbGqoABG773rmkDykF/7wqIXdE01ZC3
 navrctGn0yG1hma9aS5rvV2UsThU0Yjd4bMiwPQVhZUd6gFDlBQSorF6z+n6sUQp511sNAbf0hu
 UWULkAHBN/C3qxrvzE11aO9aYHzmwKFfu3/dzDcIbd5rvuuC0XD2MGSFmBpPxSCdQz
X-Received: by 2002:a17:90b:2549:b0:340:dd2c:a3f5 with SMTP id
 98e67ed59e1d1-352c3e84027mr3169791a91.3.1768959789946; 
 Tue, 20 Jan 2026 17:43:09 -0800 (PST)
Received: from [192.168.0.102] (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35272f4a9a1sm13069177a91.0.2026.01.20.17.43.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jan 2026 17:43:09 -0800 (PST)
Message-ID: <7076b491-9d56-47e0-8e2b-ef12a29b6419@gmail.com>
Date: Wed, 21 Jan 2026 09:43:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20260119073342.3132502-1-a0987203069@gmail.com>
 <20260119073342.3132502-3-a0987203069@gmail.com>
 <04df4909-4fdb-4046-917f-2f2e47832c62@lunn.ch>
 <a5cb949f-34c1-470c-bd04-0b35c249455f@gmail.com>
 <2e3f213b-d507-4290-91af-fba7492155d2@lunn.ch>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <2e3f213b-d507-4290-91af-fba7492155d2@lunn.ch>
Cc: ychuang3@nuvoton.com, edumazet@google.com, schung@nuvoton.com,
 yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 openbmc@lists.ozlabs.org, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 richardcochran@gmail.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com,
 krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v8 2/3] arm64: dts: nuvoton: Add
	Ethernet nodes
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
Content-Type: multipart/mixed; boundary="===============8458017393144316781=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[a0987203069@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:ychuang3@nuvoton.com,m:edumazet@google.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:openbmc@lists.ozlabs.org,m:joabreu@synopsys.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:peppe.cavallaro@st.com,m:linux-arm-kernel@lists.infradead.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[a0987203069@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[nuvoton.com,google.com,st-md-mailman.stormreply.com,kernel.org,lists.ozlabs.org,synopsys.com,redhat.com,vger.kernel.org,gmail.com,st.com,lists.infradead.org,lunn.ch,davemloft.net];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: A63294F454
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is a multi-part message in MIME format.
--===============8458017393144316781==
Content-Type: multipart/alternative;
 boundary="------------Q5WIQZLzjt3O9swZHs9BTXXB"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------Q5WIQZLzjt3O9swZHs9BTXXB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Andrew Lunn 於 1/21/2026 6:10 AM 寫道:
> Does ma35d1.dtsi represent the SOM?
ma35d1.dtsi describes the MA35D1 SoC and its integrated peripherals only.
It does not describe any board-level components and is not a SOM 
description.
>
> If so, what is ma35d1-som-256m.dts ? It looks like some odd sort of
> carrier board with a few serial ports and some memory? But systems
> like this put the memory on the SOM, not the carrier.
In our hardware design, the DDR memory is part of the board itself.
For the SOM-based product, the memory resides on the SOM module; 
therefore, it is described in the corresponding board .dts file.
Although we use "SOM" terminology internally, from a hardware and device 
tree perspective these are single-board designs,
and all |.dts| files describe complete boards.
>
> As i said, i'm confused with your naming here.

Best regards,

Joey

--------------Q5WIQZLzjt3O9swZHs9BTXXB
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">Andrew Lunn 於 1/21/2026 6:10 AM 寫道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:2e3f213b-d507-4290-91af-fba7492155d2@lunn.ch">
      <pre class="moz-quote-pre" wrap="">Does ma35d1.dtsi represent the SOM?</pre>
    </blockquote>
    ma35d1.dtsi describes the MA35D1 SoC and its integrated peripherals
    only.<br>
    It does not describe any board-level components and is not a SOM
    description.<br>
    <blockquote type="cite"
      cite="mid:2e3f213b-d507-4290-91af-fba7492155d2@lunn.ch">
      <pre class="moz-quote-pre" wrap="">

If so, what is ma35d1-som-256m.dts ? It looks like some odd sort of
carrier board with a few serial ports and some memory? But systems
like this put the memory on the SOM, not the carrier.</pre>
    </blockquote>
    In our hardware design, the DDR memory is part of the board itself.<br>
    For the SOM-based product, the memory resides on the SOM module;
    therefore, it is described in the corresponding board .dts file.<br>
    Although we use "SOM" terminology internally, from a hardware and
    device tree perspective these are single-board designs,<br>
    and all <code data-start="2948" data-end="2954">.dts</code> files
    describe complete boards.
    <blockquote type="cite"
      cite="mid:2e3f213b-d507-4290-91af-fba7492155d2@lunn.ch">
      <pre class="moz-quote-pre" wrap="">

As i said, i'm confused with your naming here.</pre>
    </blockquote>
    <p>Best regards,</p>
    <p>Joey<br>
    </p>
    <blockquote type="cite"
      cite="mid:2e3f213b-d507-4290-91af-fba7492155d2@lunn.ch">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------Q5WIQZLzjt3O9swZHs9BTXXB--

--===============8458017393144316781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8458017393144316781==--
