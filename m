Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C8C75D96C
	for <lists+linux-stm32@lfdr.de>; Sat, 22 Jul 2023 05:32:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B2B9C6A5FB;
	Sat, 22 Jul 2023 03:32:56 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com
 [216.40.44.12])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48492C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Jul 2023 03:32:55 +0000 (UTC)
Received: from omf01.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay06.hostedemail.com (Postfix) with ESMTP id 62EF6B172A;
 Sat, 22 Jul 2023 03:32:52 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf01.hostedemail.com (Postfix) with ESMTPA id 6971260011; 
 Sat, 22 Jul 2023 03:32:45 +0000 (UTC)
Message-ID: <c690776ce6fd247c2b2aeb805744d5779b6293ab.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 21 Jul 2023 20:32:44 -0700
In-Reply-To: <20230721185557.199fb5b8@kernel.org>
References: <20230721062617.9810-1-boon.khai.ng@intel.com>
 <20230721062617.9810-2-boon.khai.ng@intel.com>
 <e552cea3-abbb-93e3-4167-aebe979aac6b@kernel.org>
 <DM8PR11MB5751EAB220E28AECF6153522C13FA@DM8PR11MB5751.namprd11.prod.outlook.com>
 <8e2f9c5f-6249-4325-58b2-a14549eb105d@kernel.org>
 <20230721185557.199fb5b8@kernel.org>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Rspamd-Queue-Id: 6971260011
X-Spam-Status: No, score=-3.60
X-Rspamd-Server: rspamout02
X-Stat-Signature: 8ce7bpwzd8fica761zef7atz4eom5rxc
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18+q1NQAs+iy/04SOptAJpsQ5UyWCupHV4=
X-HE-Tag: 1689996765-765041
X-HE-Meta: U2FsdGVkX18DSXSwACs16UAGrftNgDisUeuyiaAvyz8ctZuQslVdA7tSQOcxYeDsVe6c8YlGQzWjLBLBygL1QBGzAd/InnBkcpibqTgkGnAikGZra6vCLllk1+4BPtAoqUk6+h5LGda1dv8I7cF55h9Z8m2jNJhAOdUIao8L1dNwh1hFYjkPSFkJICj31+v1DPNB1GzfP6kAtuLAHoXl5FvAEVNePVQaz7oYbR54/Htd6Ow4RIww5aD1GgVf3njgbfWGlfkabVBqKNiWCrmGU0/z6SLv/3U+ouj6/J9TDjfiFMV2/2ZtMEtXtqvJNXlTityBcvxQA7f88y5QQM96C54V3mlgidIXiS8e8K1wnqC4JcqIBvabF9GwQMtnSGSkHH7Mrt9Z35lQQ4oO+SRvtWiuVJU2KGU0f3xvThvsNW649fu2sv0/DLm2ln0YjJ04v20bGr9xihHLF9YSQGOqXRvpRaYTZCCLyvgHiGUiZa4Ob4JFX8dNzYv8xdyJyWCip8cZDMt5MyTGDKrpxHcSzuHvrArRp2ZtpjT1DAKUYUVkQCuF9wYKI383PX5nstqlV4iSzsGv8e737uGrUvV+FTeSJpDTBxiYVv0x3OgiY1fGPqEGdmTV2g5L9LV4KYf7YZVIn3+3MpCyhSOoKuMkrP/Av6GNgmMzndaevjKGdv3VoCYh2XREop2wiVkxa2jU3JJcS0Q2fivqHSHsS3kmnmelo9h3VFu/oyKZjvCjdifYYo4UXodz1LfocRDj9Eg6LFy65pSd+uQSEm1g1H6B2Vqxqc4DseGxhUk9JleEXLUjOk5zxvQ6Qaq4bk/b2AxKuGtG4zfrdSHwVzbwsX0o/H5EMPEh3zdNb132ulYrrdqB/CV0gkK8Bw==
Cc: Shevchenko Andriy <andriy.shevchenko@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Ng,
 Boon Khai" <boon.khai.ng@intel.com>, "Tham, Mun Yew" <mun.yew.tham@intel.com>,
 "Boon@ecsmtp.png.intel.com" <Boon@ecsmtp.png.intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "Khai@ecsmtp.png.intel.com" <Khai@ecsmtp.png.intel.com>, "Swee,
 Leong Ching" <leong.ching.swee@intel.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, "G Thomas,
 Rohan" <rohan.g.thomas@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
Subject: Re: [Linux-stm32] [Enable Designware XGMAC VLAN Stripping Feature
 1/2] dt-bindings: net: snps, dwmac: Add description for rx-vlan-offload
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

On Fri, 2023-07-21 at 18:55 -0700, Jakub Kicinski wrote:
> On Fri, 21 Jul 2023 18:21:32 +0200 Krzysztof Kozlowski wrote:
> > > $ ./scripts/get_maintainer.pl  --scm  -f drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c  
> > 
> > That's not how you run it. get_maintainers.pl should be run on patches
> > or on all files, not just some selection.
> 
> Adding Joe for visibility (I proposed to print a warning when people 
> do this and IIRC he wasn't on board).

What's the issue here?  Other than _how_ the script was used,
I don't see an actual problem with the script itself.

https://lore.kernel.org/lkml/20230721062617.9810-1-boon.khai.ng@intel.com/

As far as I can tell, the patch series address list was identical
for the 0/2, 1/2, and 2/2 submissions:

--------------------------------

0/2:

   From: Boon@ecsmtp.png.intel.com, Khai@ecsmtp.png.intel.com, "Ng <boon.khai.ng"@intel.com
   To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
   	Alexandre Torgue <alexandre.torgue@foss.st.com>,
   	Jose Abreu <joabreu@synopsys.com>,
   	"David S . Miller" <davem@davemloft.net>,
   	Eric Dumazet <edumazet@google.com>,
   	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
   	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
   	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
   	linux-arm-kernel@lists.infradead.org,
   	linux-kernel@vger.kernel.org
   Cc: Boon Khai Ng <boon.khai.ng@intel.com>,
   	Shevchenko Andriy <andriy.shevchenko@intel.com>,
   	Mun Yew Tham <mun.yew.tham@intel.com>,
   	Leong Ching Swee <leong.ching.swee@intel.com>,
   	G Thomas Rohan <rohan.g.thomas@intel.com>,
   	Shevchenko Andriy <andriy.shevchenko@linux.intel.com>
   Subject: [Enable Designware XGMAC VLAN Stripping Feature 0/2]
   
1/2:

   From: Boon@ecsmtp.png.intel.com, Khai@ecsmtp.png.intel.com, "Ng <boon.khai.ng"@intel.com
   To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
   	Alexandre Torgue <alexandre.torgue@foss.st.com>,
   	Jose Abreu <joabreu@synopsys.com>,
   	"David S . Miller" <davem@davemloft.net>,
   	Eric Dumazet <edumazet@google.com>,
   	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
   	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
   	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
   	linux-arm-kernel@lists.infradead.org,
   	linux-kernel@vger.kernel.org
   Cc: Boon Khai Ng <boon.khai.ng@intel.com>,
   	Shevchenko Andriy <andriy.shevchenko@intel.com>,
   	Mun Yew Tham <mun.yew.tham@intel.com>,
   	Leong Ching Swee <leong.ching.swee@intel.com>,
   	G Thomas Rohan <rohan.g.thomas@intel.com>,
   	Shevchenko Andriy <andriy.shevchenko@linux.intel.com>
   Subject: [Enable Designware XGMAC VLAN Stripping Feature 1/2] dt-bindings: net: snps,dwmac: Add description for rx-vlan-offload
   
2/2:

   From: Boon@ecsmtp.png.intel.com, Khai@ecsmtp.png.intel.com, "Ng <boon.khai.ng"@intel.com
   To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
   	Alexandre Torgue <alexandre.torgue@foss.st.com>,
   	Jose Abreu <joabreu@synopsys.com>,
   	"David S . Miller" <davem@davemloft.net>,
   	Eric Dumazet <edumazet@google.com>,
   	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
   	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
   	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
   	linux-arm-kernel@lists.infradead.org,
   	linux-kernel@vger.kernel.org
   Cc: Boon Khai Ng <boon.khai.ng@intel.com>,
   	Shevchenko Andriy <andriy.shevchenko@intel.com>,
   	Mun Yew Tham <mun.yew.tham@intel.com>,
   	Leong Ching Swee <leong.ching.swee@intel.com>,
   	G Thomas Rohan <rohan.g.thomas@intel.com>,
   	Shevchenko Andriy <andriy.shevchenko@linux.intel.com>
   Subject: [Enable Designware XGMAC VLAN Stripping Feature 2/2] net: stmmac: dwxgmac2: Add support for HW-accelerated VLAN Stripping
   
--------------------------------

vger has a limit on the number of recipients for a single email
so patch series that cc all possible recipients can be bounced
and not forwarded by vger.

So I think when submitting a patch series, it's necessary to send
just the cover letter to all mailing lists for all files/paths
modified by any file in the patch series and specific patches
are sent to maintainers, reviewers and the specific mailing lists
modified by the specific patch.

I use the scripts below to send patch series where a patch series
are the only files in individual directories.

(Well I used to use, I'm not actively reading or creating kernel patches right now)

$ cat ~/bin/to.sh
#!/bin/bash

opts="--nogit --nogit-fallback --norolestats --pattern-depth=1"

if [[ $(basename $1) =~ ^0000- ]] ; then
    ./scripts/get_maintainer.pl --nom $opts  $(dirname $1)/*
else
    maint=$(./scripts/get_maintainer.pl --nol $opts $1)
    if [ "$maint" == "" ] ; then
	echo "linux-kernel@vger.kernel.org"
    else
	echo "$maint"
    fi
fi


$ cat ~/bin/cc.sh
#!/bin/bash

opts="--nogit --nogit-fallback --norolestats"
maint_file=$(mktemp -t XXXXXXXX.cc)

if [[ $(basename $1) =~ ^0000- ]] ; then
    ./scripts/get_maintainer.pl $opts $(dirname $1)/* |  \
	~/bin/remove_undesirable_emails.sh > $maint_file
    count=$(wc -c $maint_file | cut -f1 -d" ")
    if [[ $count -lt 512 ]] ; then
	cat $maint_file
    else
	./scripts/get_maintainer.pl -nom -nor $opts $(dirname $1)/* | \
	    ~/bin/remove_undesirable_emails.sh
    fi
else
    ./scripts/get_maintainer.pl $opts $1 | \
	~/bin/remove_undesirable_emails.sh > $maint_file
    count=$(wc -l $maint_file | cut -f1 -d" ")
    if [[ $count -gt 0 ]] ; then
	cat $maint_file
    else
	./scripts/get_maintainer.pl --git --git-fallback --norolestats $1 | \
	    ~/bin/remove_undesirable_emails.sh
    fi
fi
rm -f $maint_file


$ cat ~/bin/remove_undesirable_emails.sh
grep -vPi "(?:\bIngo\s+Molnar\b)"

$

(nb: Ingo asked not to receive any emails from me)

And these scripts are used with git send-email with a .gitconfig block

[sendemail]
	chainreplyto = false
	thread = false
	suppresscc = self
	cccmd = ~/bin/cc.sh
	tocmd = ~/bin/to.sh

These scripts would have added 2 mailing lists to patch 0/n:

devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
linux-renesas-soc@vger.kernel.org (open list:ARM/RISC-V/RENESAS ARCHITECTURE)

and it would also have had a different recipient list for 1/2 as well

$ ./scripts/get_maintainer.pl -f Documentation/devicetree/bindings/net/snps,dwmac.yaml
"David S. Miller" <davem@davemloft.net> (maintainer:NETWORKING DRIVERS)
Eric Dumazet <edumazet@google.com> (maintainer:NETWORKING DRIVERS)
Jakub Kicinski <kuba@kernel.org> (maintainer:NETWORKING DRIVERS)
Paolo Abeni <pabeni@redhat.com> (maintainer:NETWORKING DRIVERS)
Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Conor Dooley <conor+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Richard Cochran <richardcochran@gmail.com> (maintainer:PTP HARDWARE CLOCK SUPPORT)
Geert Uytterhoeven <geert+renesas@glider.be> (supporter:ARM/RISC-V/RENESAS ARCHITECTURE)
Magnus Damm <magnus.damm@gmail.com> (supporter:ARM/RISC-V/RENESAS ARCHITECTURE)
Alexandre Torgue <alexandre.torgue@foss.st.com> (in file)
Giuseppe Cavallaro <peppe.cavallaro@st.com> (in file)
Jose Abreu <joabreu@synopsys.com> (in file)
netdev@vger.kernel.org (open list:NETWORKING DRIVERS)
devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
linux-kernel@vger.kernel.org (open list)
linux-renesas-soc@vger.kernel.org (open list:ARM/RISC-V/RENESAS ARCHITECTURE)



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
