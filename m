Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A042838BB
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Oct 2020 17:02:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10A45C32EA7;
	Mon,  5 Oct 2020 15:02:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2D76C32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Oct 2020 15:02:13 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 095Ew0ch006970; Mon, 5 Oct 2020 17:01:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=STMicroelectronics;
 bh=x0RKXgccVBDU8WK6ZIlsuoIcji+8/oyTQXcP6rS5GH0=;
 b=p03YsrMV7Oca9m/DegScNgiJp7Nf1sZO/ja6GgzhXWMaWQYjF4R2zPHJvyTChqhEI9P7
 Y2npR97XFKg4mCJGzX9u1Z0lxkUBqWKsLy8aq41+C/IGxn9rVyuliHEsVWW7zlpdhofA
 d4X3CqondNJvJf0DG+Yz8DDCQz1hb82k1IUeSjMu7a2rcszE+zszfR9W64bmKoMA3gLo
 +aHsFSq8XgfRWS/cuCGEVQopphT9oG7e8NknIbeYBj80iBt8IkRtwcXwplFZtq5TYW6C
 v9ae6OkASUwnKVb0bbt5zLYe9MKm+RhPihx9035G1P264RQsoQG4r08SQqcpsML2LLZm HA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3402tjh025-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Oct 2020 17:01:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5CDDD10002A;
 Mon,  5 Oct 2020 17:01:24 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2F1CE2BA2C0;
 Mon,  5 Oct 2020 17:01:24 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 5 Oct
 2020 17:01:23 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
 SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
 15.00.1473.003; Mon, 5 Oct 2020 17:01:23 +0200
From: Olivier MOYSAN <olivier.moysan@st.com>
To: Mark Brown <broonie@kernel.org>
Thread-Topic: [PATCH 1/1] ASoC: cs42l51: add soft dependency declaration
Thread-Index: AQHWmNJxA7hCFfk8OkeP77wyVojxB6mI/ZoA
Date: Mon, 5 Oct 2020 15:01:23 +0000
Message-ID: <4e7fb9c0-84ea-ba01-cea8-8044d6ff60de@st.com>
References: <20201002152904.16448-1-olivier.moysan@st.com>
 <20201002154107.GC5527@sirena.org.uk>
In-Reply-To: <20201002154107.GC5527@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-05_10:2020-10-05,
 2020-10-05 signatures=0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "perex@perex.cz" <perex@perex.cz>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "arnaud.patard@rtp-net.org" <arnaud.patard@rtp-net.org>
Subject: Re: [Linux-stm32] [PATCH 1/1] ASoC: cs42l51: add soft dependency
	declaration
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
Content-Type: multipart/mixed; boundary="===============4727981423072124036=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============4727981423072124036==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_4e7fb9c084eaba01cea88044d6ff60destcom_"

--_000_4e7fb9c084eaba01cea88044d6ff60destcom_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hello Mark,





On 10/2/20 5:41 PM, Mark Brown wrote:

On Fri, Oct 02, 2020 at 05:29:04PM +0200, Olivier Moysan wrote:


When configured as module, CS42L51 codec driver uses two modules
snd-soc-cs42l51 and snd-soc-cs42l51-i2c.
Add soft dependency on snd-soc-cs42l51-i2c in snd-soc-cs42l51,
to allow smart module dependency solving.



Doesn't the userspace tooling usually manage to figure this out from
symbol usage?



cs42l51.c does not use symbols from cs42l51-i2c.c, so cs42l51-i2c does not =
appear
as a software dependency of cs42l51, for tools such as depmod.
(cs42l51-i2c.c uses symbols from cs42l51.c,
so there is a dependency in this way, but this does not help here)


When enabling a sound card based on cs42l51, all required modules are loade=
d automatically,
excepted snd-soc-cs42l51-i2c module. This one has to be inserted explicitel=
y.

With the use of softdep, cs42l51-i2c appears as a dependency of cs42l51 for=
 depmod,
which allows the probe of snd-soc-cs42l51-i2c.


If you think there is a better way to manage this dependency please let me =
know.

Regards
Olivier


--_000_4e7fb9c084eaba01cea88044d6ff60destcom_
Content-Type: text/html; charset="Windows-1252"
Content-ID: <5020FEB05B82984C9C823403FFDBE658@st.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
</head>
<body>
<pre>Hello Mark,
</pre>
<pre>
</pre>
<div class=3D"moz-cite-prefix">On 10/2/20 5:41 PM, Mark Brown wrote:<br>
</div>
<blockquote type=3D"cite" cite=3D"mid:20201002154107.GC5527@sirena.org.uk">
<pre class=3D"moz-quote-pre" wrap=3D"">On Fri, Oct 02, 2020 at 05:29:04PM &=
#43;0200, Olivier Moysan wrote:
</pre>
<blockquote type=3D"cite">
<pre class=3D"moz-quote-pre" wrap=3D"">When configured as module, CS42L51 c=
odec driver uses two modules
snd-soc-cs42l51 and snd-soc-cs42l51-i2c.
Add soft dependency on snd-soc-cs42l51-i2c in snd-soc-cs42l51,
to allow smart module dependency solving.
</pre>
</blockquote>
<pre class=3D"moz-quote-pre" wrap=3D"">
Doesn't the userspace tooling usually manage to figure this out from
symbol usage?
</pre>
</blockquote>
<br>
<pre>cs42l51.c does not use symbols from cs42l51-i2c.c, so cs42l51-i2c does=
 not appear
as a software dependency of cs42l51, for tools such as depmod.
(cs42l51-i2c.c uses symbols from cs42l51.c,=20
so there is a dependency in this way, but this does not help here)
</pre>
<pre>When enabling a sound card based on cs42l51, all required modules are =
loaded automatically,
excepted snd-soc-cs42l51-i2c module. This one has to be inserted explicitel=
y.

With the use of softdep, cs42l51-i2c appears as a dependency of cs42l51 for=
 depmod,
which allows the probe of snd-soc-cs42l51-i2c.
</pre>
<pre>If you think there is a better way to manage this dependency please le=
t me know.

Regards
Olivier
</pre>
</body>
</html>

--_000_4e7fb9c084eaba01cea88044d6ff60destcom_--

--===============4727981423072124036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4727981423072124036==--
